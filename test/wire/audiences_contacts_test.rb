# frozen_string_literal: true

require_relative "wiremock_test_case"

class AudiencesContactsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_audiences_contacts_remove_with_wiremock
    test_id = "audiences.contacts.remove.0"

    @client.audiences.contacts.remove(
      id: "aud_abc123",
      contacts: ["+12125551234", "co_def456"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "audiences.contacts.remove.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/audiences/contacts",
      query_params: nil,
      expected: 1
    )
  end

  def test_audiences_contacts_add_with_wiremock
    test_id = "audiences.contacts.add.0"

    @client.audiences.contacts.add(
      id: "aud_abc123",
      contacts: ["+12125551234", "co_def456", "+13105551234"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "audiences.contacts.add.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/audiences/contacts",
      query_params: nil,
      expected: 1
    )
  end
end
