# frozen_string_literal: true

require_relative "wiremock_test_case"

class ToolsContactCardWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tools_contact_card_get_with_wiremock
    test_id = "tools.contact_card.get.0"

    @client.tools.contact_card.get(
      id: "cc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.contact_card.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tools/contact-card",
      query_params: nil,
      expected: 1
    )
  end

  def test_tools_contact_card_upsert_with_wiremock
    test_id = "tools.contact_card.upsert.0"

    @client.tools.contact_card.upsert(
      id: "cc_1234567890",
      formatted_name: "Jane Smith",
      name: {
        family_name: "Smith",
        given_name: "Jane",
        additional_names: ["A."],
        honorific_prefixes: ["Dr."],
        honorific_suffixes: ["PhD"]
      },
      nickname: ["Janie"],
      birthday: "1990-02-15",
      addresses: [{
        country_name: "USA",
        extended_address: "Apt. 4B",
        locality: "Anytown",
        postal_code: "90210",
        post_office_box: "PO Box 123",
        region: "CA",
        street_address: "123 Main St",
        type: %w[HOME PREF]
      }],
      url: "https://app.pinnacle.sh",
      phones: [{
        type: ["CELL"],
        value: "+15551234567"
      }],
      emails: [{
        type: ["INTERNET"],
        value: "jane.smith@example.com"
      }],
      timezone: "America/Los_Angeles",
      geo: {
        latitude: 34.0522,
        longitude: -118.2437
      },
      title: "Engineer",
      role: "Developer",
      organization: {
        name: "Acme Co",
        units: ["Engineering", "R&D"]
      },
      categories: %w[Friend Colleague],
      note: "Test contact entry",
      photo: "https://fastly.picsum.photos/id/853/200/200.jpg?hmac=f4LF-tVBBnJb9PQAVEO8GCTGWgLUnxQLw44rUofE6mQ",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tools.contact_card.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/tools/contact-card/upsert",
      query_params: nil,
      expected: 1
    )
  end
end
