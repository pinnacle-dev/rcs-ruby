# frozen_string_literal: true

require_relative "wiremock_test_case"

class ToolsUrlWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tools_url_create_with_wiremock
    test_id = "tools.url.create.0"

    @client.tools.url.create(
      url: "https://www.pinnacle.sh/",
      options: {
        expires_at: "2025-06-23T16:18:25.000Z"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.url.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tools/url",
      query_params: nil,
      expected: 1
    )
  end

  def test_tools_url_get_with_wiremock
    test_id = "tools.url.get.0"

    @client.tools.url.get(
      link_id: "ePzVxILF",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.url.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/tools/url/ePzVxILF",
      query_params: nil,
      expected: 1
    )
  end

  def test_tools_url_update_with_wiremock
    test_id = "tools.url.update.0"

    @client.tools.url.update(
      link_id: "ePzVxILF",
      url: "https://www.pinnacle.sh/",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.url.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/tools/url/ePzVxILF",
      query_params: nil,
      expected: 1
    )
  end
end
