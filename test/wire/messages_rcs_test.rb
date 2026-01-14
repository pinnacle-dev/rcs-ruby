# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesRcsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_rcs_send__with_wiremock
    test_id = "messages.rcs.send_.0"

    @client.messages.rcs.send_(
      from: "from",
      to: "to",
      quick_replies: [],
      text: "text",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.rcs.send_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/send/rcs",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_rcs_send_typing_with_wiremock
    test_id = "messages.rcs.send_typing.0"

    @client.messages.rcs.send_typing(
      agent_id: "agent_pinnacle",
      to: "+14154746461",
      options: {
        test_mode: false
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.rcs.send_typing.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/send/typing",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_rcs_validate_with_wiremock
    test_id = "messages.rcs.validate.0"

    @client.messages.rcs.validate(
      quick_replies: [],
      text: "text",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.rcs.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/validate/rcs",
      query_params: nil,
      expected: 1
    )
  end
end
