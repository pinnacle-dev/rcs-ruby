# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesSmsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_sms_send__with_wiremock
    test_id = "messages.sms.send_.0"

    @client.messages.sms.send_(
      from: "+14155164736",
      text: "Hey!",
      to: "+14154746461",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.sms.send_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/send/sms",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_sms_validate_with_wiremock
    test_id = "messages.sms.validate.0"

    @client.messages.sms.validate(
      text: "Hello from Pinnacle",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.sms.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/validate/sms",
      query_params: nil,
      expected: 1
    )
  end
end
