# frozen_string_literal: true

require_relative "wiremock_test_case"

class PhoneNumbersCampaignWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_phone_numbers_campaign_attach_with_wiremock
    test_id = "phone_numbers.campaign.attach.0"

    @client.phone_numbers.campaign.attach(
      phones: ["+14155550123", "+14155559876", "+14155550111"],
      campaign_type: "TOLL_FREE",
      campaign_id: "tf_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.campaign.attach.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/phone-numbers/attach-campaign",
      query_params: nil,
      expected: 1
    )
  end

  def test_phone_numbers_campaign_detach_with_wiremock
    test_id = "phone_numbers.campaign.detach.0"

    @client.phone_numbers.campaign.detach(
      phones: ["+14155559876", "14155550111"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.campaign.detach.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/phone-numbers/detach-campaign",
      query_params: nil,
      expected: 1
    )
  end
end
