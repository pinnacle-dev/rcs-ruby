# frozen_string_literal: true

require_relative "wiremock_test_case"

class RcsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_rcs_get_capabilities_with_wiremock
    test_id = "rcs.get_capabilities.0"

    @client.rcs.get_capabilities(
      phone_numbers: ["+12345678901", "+19876543210"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rcs.get_capabilities.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/rcs/capabilities",
      query_params: nil,
      expected: 1
    )
  end

  def test_rcs_whitelist_with_wiremock
    test_id = "rcs.whitelist.0"

    @client.rcs.whitelist(
      agent_id: "agent_XXXXXXXXXXXX",
      phone_number: "+12345678901",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rcs.whitelist.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/rcs/whitelist",
      query_params: nil,
      expected: 1
    )
  end

  def test_rcs_get_link_with_wiremock
    test_id = "rcs.get_link.0"

    @client.rcs.get_link(
      agent_id: "agent_XXXXXXXXXXXX",
      test_mode: false,
      phone_number: "+12345678901",
      body: "Hello, I need help with my order",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "rcs.get_link.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/rcs/link",
      query_params: nil,
      expected: 1
    )
  end
end
