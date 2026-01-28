# frozen_string_literal: true

require_relative "wiremock_test_case"

class BrandsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_brands_autofill_with_wiremock
    test_id = "brands.autofill.0"

    @client.brands.autofill(
      additional_info: "A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.",
      name: "Pinnacle",
      options: {
        force_reload: true
      },
      website: "https://www.pinnacle.sh",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "brands.autofill.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/brands/autofill",
      query_params: nil,
      expected: 1
    )
  end

  def test_brands_upsert_with_wiremock
    test_id = "brands.upsert.0"

    @client.brands.upsert(
      address: "500 Folsom St, San Francisco, CA 94105",
      contact: {
        email: "michael.chen@trypinnacle.app",
        name: "Michael Chen",
        phone: "+14155551234",
        title: "Customer Support Representative"
      },
      dba: "Pinnacle RCS",
      description: "A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.",
      ein: "88-1234567",
      email: "founders@trypinnacle.app",
      id: "b_1234567890",
      name: "Pinnacle",
      sector: "TECHNOLOGY",
      type: "PRIVATE_PROFIT",
      entity_type: "LLC",
      website: "https://www.pinnacle.sh",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "brands.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/brands",
      query_params: nil,
      expected: 1
    )
  end

  def test_brands_get_with_wiremock
    test_id = "brands.get.0"

    @client.brands.get(
      id: "b_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "brands.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/brands/b_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_brands_submit_with_wiremock
    test_id = "brands.submit.0"

    @client.brands.submit(
      brand_id: "b_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "brands.submit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/brands/b_1234567890/submit",
      query_params: nil,
      expected: 1
    )
  end

  def test_brands_validate_with_wiremock
    test_id = "brands.validate.0"

    @client.brands.validate(request_options: {
                              additional_headers: {
                                "X-Test-Id" => "brands.validate.0"
                              }
                            })

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/brands/validate",
      query_params: nil,
      expected: 1
    )
  end

  def test_brands_vet_with_wiremock
    test_id = "brands.vet.0"

    @client.brands.vet(
      brand_id: "b_1234567890",
      type: "EXTERNAL",
      provider: "AEGIS",
      vetting_class: "STANDARD",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "brands.vet.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/brands/b_1234567890/vet",
      query_params: nil,
      expected: 1
    )
  end
end
