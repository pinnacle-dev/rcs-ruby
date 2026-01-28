# frozen_string_literal: true

require_relative "wiremock_test_case"

class ToolsFileWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tools_file_upload_with_wiremock
    test_id = "tools.file.upload.0"

    @client.tools.file.upload(
      content_type: "image/jpeg",
      size: 1024,
      name: "test.jpg",
      options: {
        delete_at: "2025-12-31T23:59:59Z",
        download: {
          expires_at: "2025-06-30T12:00:00.000Z"
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.file.upload.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tools/files/upload",
      query_params: nil,
      expected: 1
    )
  end

  def test_tools_file_refresh_with_wiremock
    test_id = "tools.file.refresh.0"

    @client.tools.file.refresh(
      urls: ["https://server.trypinnacle.app/storage/v1/object/sign/vault/3/test.jpg?token=oldtoken", "https://server.trypinnacle.app/storage/v1/object/sign/vault/3/document.pdf?token=oldtoken2", "invalid/url", "https://google.com"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.file.refresh.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tools/files/refresh",
      query_params: nil,
      expected: 1
    )
  end
end
