# frozen_string_literal: true

require_relative "wiremock_test_case"

class PhoneNumbersWebhookWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_phone_numbers_webhook_attach_with_wiremock
    test_id = "phone_numbers.webhook.attach.0"

    @client.phone_numbers.webhook.attach(
      phone: "%2B14155551234",
      webhook_id: "wh_1234567890",
      event: "MESSAGE.STATUS",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.webhook.attach.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/phone-numbers/%2B14155551234/attach-webhook",
      query_params: nil,
      expected: 1
    )
  end

  def test_phone_numbers_webhook_detach_with_wiremock
    test_id = "phone_numbers.webhook.detach.0"

    @client.phone_numbers.webhook.detach(
      phone: "+14155551234",
      webhook_id: "wh_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.webhook.detach.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/phone-numbers/+14155551234/detach-webhook/wh_1234567890",
      query_params: nil,
      expected: 1
    )
  end
end
