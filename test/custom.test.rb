# frozen_string_literal: true

require "json"
require_relative "../lib/rcs"

# This test is run via command line: rake customtest
describe "Custom Test" do
  it "processes call status events" do
    client = Pinnacle::Client.new(api_key: "test")
    event = client.messages.process(
      {
        headers: { "PINNACLE-SIGNING-SECRET" => "secret" },
        body: {
          type: "CALL.STATUS",
          sender: "+15551112222",
          call: {
            id: "call_123",
            from: "+15551112222",
            to: "+15551113333",
            direction: "OUTBOUND",
            status: "ANSWERED"
          }
        }.to_json
      },
      secret: "secret"
    )

    assert_instance_of Pinnacle::Types::CallStatusEvent, event
    assert_equal "CALL.STATUS", event.type
    assert_equal "ANSWERED", event.call.status
  end

  it "exports command constants for every developer command" do
    assert_equal [
      "call.answer",
      "call.end",
      "call.transfer",
      "recording.start",
      "recording.stop",
      "audio.play",
      "audio.stop",
      "audio.reduce_noise",
      "input.get",
      "input.cancel",
      "dtmf.send",
      "call.update_state"
    ], Pinnacle::Wrapper::Voice::Types::VOICE_COMMAND_ACTIONS
  end

  it "connects a stream with an injected socket implementation" do
    FakeSocket.instances = []
    client = Pinnacle::Client.new(api_key: "test")
    socket = client.voice.connect_stream(
      "wss://voice.example.test/stream",
      socket: FakeSocket,
      protocols: "voice.v1"
    )

    assert_instance_of Pinnacle::Wrapper::Voice::VoiceSocket, socket
    assert_equal "wss://voice.example.test/stream", FakeSocket.instances.last.url
    assert_equal "voice.v1", FakeSocket.instances.last.protocols
  end

  it "serializes command and media helpers exactly as the gateway expects" do
    fake = FakeSocket.new("wss://voice.example.test/stream")
    socket = Pinnacle::Wrapper::Voice::VoiceSocket.new(fake)

    socket.answer({ as: "Agent" }, command_id: "cmd_answer")
    socket.transfer({ call_id: "call_target", as: "Support" }, command_id: "cmd_bridge")
    socket.play_audio({ text: "Please hold", voice: "alloy" }, command_id: "cmd_play")
    socket.reduce_noise({ enabled: true, direction: "both" }, command_id: "cmd_noise")
    socket.get_input({ maxDigits: 4, terminatingDigit: "#" }, command_id: "cmd_input")
    socket.send_dtmf({ digits: "1234#", duration_ms: 250 }, command_id: "cmd_dtmf")
    socket.update_state({ metadata: { customer_id: "cus_123" } }, command_id: "cmd_state")
    socket.send_media({ track: "outbound", payload: "base64-pcm", chunk: 7 })

    expected_frames = [
      { "event" => "command", "command_id" => "cmd_answer", "action" => "call.answer", "params" => { "as" => "Agent" } },
      {
        "event" => "command",
        "command_id" => "cmd_bridge",
        "action" => "call.transfer",
        "params" => { "call_id" => "call_target", "as" => "Support" }
      },
      {
        "event" => "command",
        "command_id" => "cmd_play",
        "action" => "audio.play",
        "params" => { "text" => "Please hold", "voice" => "alloy" }
      },
      {
        "event" => "command",
        "command_id" => "cmd_noise",
        "action" => "audio.reduce_noise",
        "params" => { "enabled" => true, "direction" => "both" }
      },
      {
        "event" => "command",
        "command_id" => "cmd_input",
        "action" => "input.get",
        "params" => { "maxDigits" => 4, "terminatingDigit" => "#" }
      },
      {
        "event" => "command",
        "command_id" => "cmd_dtmf",
        "action" => "dtmf.send",
        "params" => { "digits" => "1234#", "duration_ms" => 250 }
      },
      {
        "event" => "command",
        "command_id" => "cmd_state",
        "action" => "call.update_state",
        "params" => { "metadata" => { "customer_id" => "cus_123" } }
      },
      { "event" => "media", "media" => { "track" => "outbound", "payload" => "base64-pcm", "chunk" => 7 } }
    ]

    actual_frames = fake.sent.map { |payload| JSON.parse(payload) }

    assert_equal expected_frames, actual_frames
  end

  it "routes server frames and resolves pending command acks" do
    fake = FakeSocket.new("wss://voice.example.test/stream")
    socket = Pinnacle::Wrapper::Voice::VoiceSocket.new(fake)
    frames = []
    events = []
    media = []

    socket.on("frame") { |frame| frames << frame }
    socket.on("event") { |frame| events << frame }
    socket.on("media") { |frame| media << frame }

    waiter = socket.wait_for_ack("cmd_wait", timeout_ms: 100)
    socket.command({ event: "command", command_id: "cmd_wait", action: "audio.stop" })
    fake.emit_message(
      {
        event: "event",
        type: "call.answered",
        stream_sid: "stream_123",
        sequence_number: 1,
        payload: { call_id: "call_123" }
      }
    )
    fake.emit_message(
      {
        event: "media",
        stream_sid: "stream_123",
        sequence_number: 2,
        media: { track: "inbound", payload: "base64-pcm" }
      }
    )
    fake.emit_message({ event: "ack", command_id: "cmd_wait", action: "audio.stop", status: "ok" })
    ack = waiter.call

    assert_equal "ok", ack["status"]
    assert_equal 3, frames.length
    assert_equal 1, events.length
    assert_equal 1, media.length
  end

  it "surfaces invalid server frames through the error listener" do
    fake = FakeSocket.new("wss://voice.example.test/stream")
    socket = Pinnacle::Wrapper::Voice::VoiceSocket.new(fake)
    errors = []

    socket.on("error") { |error| errors << error }
    fake.emit_raw_message("{")

    assert_instance_of JSON::ParserError, errors.first
  end

  it "waits for open and supports manual reconnect" do
    FakeSocket.instances = []
    first = FakeSocket.new("wss://voice.example.test/first")
    first.ready_state = 0
    socket = Pinnacle::Wrapper::Voice::VoiceSocket.new(
      first,
      create_socket: -> { FakeSocket.new("wss://voice.example.test/second") }
    )

    first.open
    socket.wait_until_open(timeout_ms: 100)
    socket.reconnect_now

    assert_same FakeSocket.instances.last, socket.socket
    assert_equal "wss://voice.example.test/second", FakeSocket.instances.last.url
  end

  it "auto reconnects fixed stream urls when enabled" do
    FakeSocket.instances = []
    client = Pinnacle::Client.new(api_key: "test")
    socket = client.voice.connect_stream(
      "wss://voice.example.test/fixed",
      socket: FakeSocket,
      reconnect: { enabled: true, initial_delay_ms: 1, max_attempts: 2 }
    )
    reconnected = []
    socket.on("reconnected") { |event| reconnected << event }

    FakeSocket.instances.first.close
    wait_for { reconnected.length == 1 }

    assert_equal [
      "wss://voice.example.test/fixed",
      "wss://voice.example.test/fixed"
    ], FakeSocket.instances.map(&:url)
  end

  it "refreshes stream tokens when reconnecting call streams" do
    FakeSocket.instances = []
    client = Pinnacle::Client.new(api_key: "test")
    fake_calls = FakeCalls.new(["wss://voice.example.test/token-1", "wss://voice.example.test/token-2"])
    client.voice.instance_variable_set(:@calls, fake_calls)
    socket = client.voice.connect(
      call_id: "call_123",
      socket: FakeSocket,
      reconnect: { enabled: true, initial_delay_ms: 1, max_attempts: 2 }
    )
    reconnected = []
    socket.on("reconnected") { |event| reconnected << event }

    FakeSocket.instances.first.close
    wait_for { reconnected.length == 1 }

    assert_equal %w[call_123 call_123], fake_calls.requests
    assert_equal [
      "wss://voice.example.test/token-1",
      "wss://voice.example.test/token-2"
    ], FakeSocket.instances.map(&:url)
  end

  def wait_for
    deadline = Time.now + 1
    until Time.now >= deadline
      return if yield

      sleep 0.01
    end
    raise "Timed out waiting for condition."
  end
end

class FakeStreamToken
  attr_reader :stream_url

  def initialize(stream_url)
    @stream_url = stream_url
  end
end

class FakeCalls
  attr_reader :requests

  def initialize(stream_urls)
    @stream_urls = stream_urls
    @requests = []
  end

  def create_stream_token(**params)
    @requests << params.fetch(:id)
    FakeStreamToken.new(@stream_urls.fetch(@requests.length - 1))
  end
end

class FakeSocket
  class << self
    attr_accessor :instances
  end

  attr_accessor :ready_state
  attr_reader :url, :protocols, :sent

  self.instances = []

  def initialize(url, protocols = nil)
    @url = url
    @protocols = protocols
    @sent = []
    @listeners = Hash.new { |hash, key| hash[key] = [] }
    @ready_state = 1
    self.class.instances << self
  end

  def send(data)
    @sent << data
  end

  def close(*)
    @ready_state = 3
    emit("close", {})
  end

  def open
    @ready_state = 1
    emit("open", {})
  end

  def add_event_listener(event, &listener)
    @listeners[event] << listener
  end

  def emit_message(frame)
    emit_raw_message(JSON.generate(frame))
  end

  def emit_raw_message(data)
    emit("message", { data: data })
  end

  def emit(event, payload)
    @listeners[event].each { |listener| listener.call(payload) }
  end
end
