# frozen_string_literal: true

require_relative "wiremock_test_case"

class CampaignsTollFreeWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_campaigns_toll_free_autofill_with_wiremock
    test_id = "campaigns.toll_free.autofill.0"

    @client.campaigns.toll_free.autofill(
      additional_info: "Please autofill missing campaign fields using my brand profile",
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.toll_free.autofill.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/toll-free/autofill",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_toll_free_get_with_wiremock
    test_id = "campaigns.toll_free.get.0"

    @client.campaigns.toll_free.get(
      campaign_id: "tf_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.toll_free.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/campaigns/toll-free/tf_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_toll_free_submit_with_wiremock
    test_id = "campaigns.toll_free.submit.0"

    @client.campaigns.toll_free.submit(
      campaign_id: "tf_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.toll_free.submit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/toll-free/submit/tf_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_toll_free_upsert_with_wiremock
    test_id = "campaigns.toll_free.upsert.0"

    @client.campaigns.toll_free.upsert(
      brand: "b_1234567890",
      campaign_id: "tf_1234567890",
      keywords: {
        help: {
          message: "Pinnacle Software Development Inc.: For assistance, visit https://pinnacle.sh/support or email founders@trypinnacle.app. Msg&data rates may apply. Reply STOP to cancel."
        },
        opt_in: {
          message: "Pinnacle Software Development Inc.: You're enrolled in account & security alerts. Msg&data rates may apply. Message frequency varies. Reply HELP for help, STOP to cancel. Terms: https://pinnacle.sh/terms/ Privacy: https://pinnacle.sh/privacy/",
          keywords: %w[START SUBSCRIBE]
        }
      },
      links: {
        privacy_policy: "https://www.pinnacle.sh/privacy",
        terms_of_service: "https://www.pinnacle.sh/terms"
      },
      monthly_volume: "10,000",
      name: "Pinnacle",
      opt_in: {
        method_: "PAPER",
        url: "https://www.pinnacle.sh/opt-in",
        workflow_description: "End users opt-in when filling out the in-person intake forms where they will write their phone numbers and check a box indicating that they've opted in to messages. Link to paper form: https://www.pinnacle.sh/opt-in"
      },
      options: {
        age_gated: false
      },
      production_message_content: "Hi [First Name], your order #[Order ID] has shipped and will arrive [Date]. Track here: [URL]. Reply HELP for help or STOP to unsubscribe.",
      use_case: {
        summary: "Customers who have opted into text messages can interact with our automated SMS chatbot to receive transaction-driven notifications (order status, shipping updates, account alerts), ask support questions, share photos with friends, and manage their account details via simple, conversational text flows. All messages are transactional or interactive flows customers opt into. Users can send images (e.g., receipts) and get guided replies.",
        value: "CHATBOT"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.toll_free.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/toll-free",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_toll_free_validate_with_wiremock
    test_id = "campaigns.toll_free.validate.0"

    @client.campaigns.toll_free.validate(
      additional_info: "Please validate this DLC campaign for 10DLC compliance",
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.toll_free.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/toll-free/validate",
      query_params: nil,
      expected: 1
    )
  end
end
