# frozen_string_literal: true

require_relative "wiremock_test_case"

class ContactsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_contacts_get_with_wiremock
    test_id = "contacts.get.0"

    @client.contacts.get(
      id: "co_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "contacts.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/contacts",
      query_params: nil,
      expected: 1
    )
  end

  def test_contacts_create_with_wiremock
    test_id = "contacts.create.0"

    @client.contacts.create(
      phone_number: "phoneNumber",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "contacts.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/contacts",
      query_params: nil,
      expected: 1
    )
  end

  def test_contacts_update_with_wiremock
    test_id = "contacts.update.0"

    @client.contacts.update(
      description: "Retired",
      email: "alvaroopedtech@pinnacle.sh",
      name: "Retired Bestie",
      tags: ["friend"],
      id: "co_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "contacts.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/contacts",
      query_params: nil,
      expected: 1
    )
  end
end
