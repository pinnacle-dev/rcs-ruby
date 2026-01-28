# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_get_with_wiremock
    test_id = "messages.get.0"

    @client.messages.get(
      id: "msg_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/messages/msg_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_react_with_wiremock
    test_id = "messages.react.0"

    @client.messages.react(
      message_id: "msg_1234567890",
      options: {
        force: true
      },
      reaction: "👍",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.react.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/react",
      query_params: nil,
      expected: 1
    )
  end
end
