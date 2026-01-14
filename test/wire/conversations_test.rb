# frozen_string_literal: true

require_relative "wiremock_test_case"

class ConversationsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_conversations_get_with_wiremock
    test_id = "conversations.get.0"

    @client.conversations.get(
      id: "conv_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "conversations.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/conversations/get",
      query_params: nil,
      expected: 1
    )
  end

  def test_conversations_list_with_wiremock
    test_id = "conversations.list.0"

    @client.conversations.list(
      brand_id: "b_1234567890",
      campaign_id: "tf_1234567890",
      campaign_type: "TOLL_FREE",
      page_index: 0,
      page_size: 20,
      receiver: "+16509231662",
      sender: "+18445551234",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "conversations.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/conversations/list",
      query_params: nil,
      expected: 1
    )
  end

  def test_conversations_update_with_wiremock
    test_id = "conversations.update.0"

    @client.conversations.update(
      id: "conv_1234567890",
      notes: "Follow-up completed. Customer satisfied with resolution.",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "conversations.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/conversations/update",
      query_params: nil,
      expected: 1
    )
  end

  def test_conversations_list_messages_with_wiremock
    test_id = "conversations.list_messages.0"

    @client.conversations.list_messages(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "conversations.list_messages.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/conversations/id/messages",
      query_params: nil,
      expected: 1
    )
  end
end
