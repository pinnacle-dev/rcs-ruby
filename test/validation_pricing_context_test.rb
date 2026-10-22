# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/rcs"

class ValidationPricingContextTest < Minitest::Test
  class CaptureClient
    attr_reader :request

    def send(request)
      @request = request
      Struct.new(:code, :body).new("200", JSON.generate({
        unit: 0.006, total: { gsm7: 0.006, utf16: 0.006 }, segments: {},
        pricingContext: { status: "RESOLVED", direction: "INBOUND", category: "SMS_10DLC" }
      }))
    end
  end

  def test_sms_context_reaches_wire_and_response_is_deserialized
    raw = CaptureClient.new
    client = Pinnacle::Messages::Sms::Client.new(client: raw)
    result = client.validate(text: "Hello", sender: "+14155550123", direction: "INBOUND")
    assert_equal({ "text" => "Hello", "sender" => "+14155550123", "direction" => "INBOUND" }, raw.request.body)
    assert_equal "RESOLVED", result.pricing_context.status
    assert_equal 0.006, result.unit
    assert_equal 0.006, result.total.gsm_7
    assert_equal 0.006, result.total.utf_16
  end

  def test_rcs_decimal_response_preserves_precision
    result = Pinnacle::Types::RcsValidationResult.load(JSON.generate({ unit: 0.00755, total: 0.0151, segments: 2, unsupportedFiles: [] }))
    assert_equal 0.00755, result.unit
    assert_equal 0.0151, result.total
  end

  def test_legacy_sms_remains_valid
    raw = CaptureClient.new
    Pinnacle::Messages::Sms::Client.new(client: raw).validate(text: "Hello")
    assert_equal({ "text" => "Hello" }, raw.request.body)
  end

  def test_all_rcs_content_variants_keep_context
    [
      [Pinnacle::Types::RcsValidateContentText, { text: "Hello" }],
      [Pinnacle::Types::RcsValidateContentMedia, { media: "https://example.com/image.png" }],
      [Pinnacle::Types::RcsValidateContentCards, { cards: [{ title: "Hello" }] }]
    ].each do |type, content|
      data = type.new(**content, sender: "agent_example", direction: "OUTBOUND").to_h
      assert_equal "agent_example", data["sender"]
      assert_equal "OUTBOUND", data["direction"]
    end
  end
end
