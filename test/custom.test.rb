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
end
