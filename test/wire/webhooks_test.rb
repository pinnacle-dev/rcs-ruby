# frozen_string_literal: true

require_relative "wiremock_test_case"

class WebhooksWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_webhooks_get_with_wiremock
    test_id = "webhooks.get.0"

    @client.webhooks.get(
      identifiers: ["https://www.pinnacle.sh/payment", "+14155678901", "https://www.pinnacle.sh/sms-callback", "+14153456659"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "webhooks.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/webhooks",
      query_params: nil,
      expected: 1
    )
  end
end
