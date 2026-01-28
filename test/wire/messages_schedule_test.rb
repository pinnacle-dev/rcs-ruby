# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesScheduleWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_schedule_cancel_with_wiremock
    test_id = "messages.schedule.cancel.0"

    @client.messages.schedule.cancel(
      id: "id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.schedule.cancel.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/messages/schedule/id",
      query_params: nil,
      expected: 1
    )
  end
end
