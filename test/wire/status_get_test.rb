# frozen_string_literal: true

require_relative "wiremock_test_case"

class StatusGetWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_status_get_brand_with_wiremock
    test_id = "status.get.brand.0"

    @client.status.get.brand(
      brand_id: "b_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "status.get.brand.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/status/brand/b_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_status_get_toll_free_with_wiremock
    test_id = "status.get.toll_free.0"

    @client.status.get.toll_free(
      campaign_id: "tf_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "status.get.toll_free.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/status/toll-free-campaign/tf_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_status_get_dlc_with_wiremock
    test_id = "status.get.dlc.0"

    @client.status.get.dlc(
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "status.get.dlc.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/status/dlc-campaign/dlc_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_status_get_rcs_with_wiremock
    test_id = "status.get.rcs.0"

    @client.status.get.rcs(
      campaign_id: "rcs_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "status.get.rcs.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/status/rcs-campaign/rcs_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_status_get_phone_number_with_wiremock
    test_id = "status.get.phone_number.0"

    @client.status.get.phone_number(
      phone_number: "+14151234567",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "status.get.phone_number.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/status/phone-number/+14151234567",
      query_params: nil,
      expected: 1
    )
  end
end
