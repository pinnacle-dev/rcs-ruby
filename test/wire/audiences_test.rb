# frozen_string_literal: true

require_relative "wiremock_test_case"

class AudiencesWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_audiences_get_with_wiremock
    test_id = "audiences.get.0"

    @client.audiences.get(
      id: "aud_abc123",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "audiences.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/audiences",
      query_params: { "id" => "aud_abc123" },
      expected: 1
    )
  end

  def test_audiences_create_with_wiremock
    test_id = "audiences.create.0"

    @client.audiences.create(
      name: "Marketing Campaign Q1",
      description: "Contacts for Q1 marketing push",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "audiences.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/audiences",
      query_params: nil,
      expected: 1
    )
  end

  def test_audiences_delete_with_wiremock
    test_id = "audiences.delete.0"

    @client.audiences.delete(
      id: "aud_abc123",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "audiences.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/audiences",
      query_params: { "id" => "aud_abc123" },
      expected: 1
    )
  end

  def test_audiences_update_with_wiremock
    test_id = "audiences.update.0"

    @client.audiences.update(
      id: "aud_abc123",
      name: "Updated Audience Name",
      description: "New description",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "audiences.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/audiences",
      query_params: nil,
      expected: 1
    )
  end
end
