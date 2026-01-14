# frozen_string_literal: true

require_relative "wiremock_test_case"

class PhoneNumbersWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_phone_numbers_search_with_wiremock
    test_id = "phone_numbers.search.0"

    @client.phone_numbers.search(
      features: %w[SMS MMS],
      location: {
        city: "New York",
        national_destination_code: "212"
      },
      number: {
        contains: "514",
        starts_with: "45"
      },
      options: {
        limit: 4
      },
      type: ["LOCAL"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.search.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/phone-numbers/search",
      query_params: nil,
      expected: 1
    )
  end

  def test_phone_numbers_buy_with_wiremock
    test_id = "phone_numbers.buy.0"

    @client.phone_numbers.buy(
      numbers: ["+18559491727"],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.buy.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/phone-numbers/buy",
      query_params: nil,
      expected: 1
    )
  end

  def test_phone_numbers_get_with_wiremock
    test_id = "phone_numbers.get.0"

    @client.phone_numbers.get(
      phone: "+11234567890",
      level: "advanced",
      options: {
        risk: true,
        enhanced_contact_info: {
          context: "This is my friend from JZ. He has done a lot in the crypto space."
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "phone_numbers.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/phone-numbers/details",
      query_params: nil,
      expected: 1
    )
  end
end
