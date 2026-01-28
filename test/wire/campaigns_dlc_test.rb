# frozen_string_literal: true

require_relative "wiremock_test_case"

class CampaignsDlcWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_campaigns_dlc_autofill_with_wiremock
    test_id = "campaigns.dlc.autofill.0"

    @client.campaigns.dlc.autofill(
      additional_info: "Please autofill missing campaign fields using my brand profile",
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.dlc.autofill.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/dlc/autofill",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_dlc_get_with_wiremock
    test_id = "campaigns.dlc.get.0"

    @client.campaigns.dlc.get(
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.dlc.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/campaigns/dlc/dlc_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_dlc_submit_with_wiremock
    test_id = "campaigns.dlc.submit.0"

    @client.campaigns.dlc.submit(
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.dlc.submit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/dlc/submit/dlc_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_dlc_upsert_with_wiremock
    test_id = "campaigns.dlc.upsert.0"

    @client.campaigns.dlc.upsert(
      auto_renew: true,
      brand: "b_1234567890",
      description: "This campaign sends transactional SMS messages to customers who have opted in, including account notifications, security alerts, and customer care responses. Messages are sent when triggered by account activity such as login attempts, password changes, order updates, or support inquiries. All messages include required STOP/HELP disclosures and comply with TCPA guidelines.",
      keywords: {
        help: {
          message: "Pinnacle Software Development Inc.: For assistance, visit https://pinnacle.sh/support or email founders@trypinnacle.app. Msg&data rates may apply. Reply STOP to cancel.",
          values: %w[HELP SUPPORT INFO]
        },
        opt_in: {
          message: "Pinnacle Software Development Inc.: You're enrolled in account & security alerts. Msg&data rates may apply. Message frequency varies. Reply HELP for help, STOP to cancel. Terms: https://pinnacle.sh/terms Privacy: https://pinnacle.sh/privacy",
          values: %w[START YES SUBSCRIBE]
        },
        opt_out: {
          message: "Pinnacle Software Development Inc.: You're unsubscribed and will receive no further texts. For assistance, visit https://pinnacle.sh or call 877-389-0460. Reply START to resubscribe.",
          values: %w[STOP CANCEL UNSUBSCRIBE]
        }
      },
      links: {
        privacy_policy: "https://www.pinnacle.sh/privacy",
        terms_of_service: "https://www.pinnacle.sh/terms"
      },
      message_flow: 'The user fills out a paper form during onboarding at [Address] which they learn about at our website (https://pinnacle.sh) in which they provide their phone number and sign their consent. The form includes a disclaimer: "By signing this form and providing your phone number, you agree to receive SMS Mixed - Account Notification, Customer Care, Security Alert, Delivery Notification from Pinnacle Software Development Inc. Message frequency may vary. Standard Message and Data Rates may apply. Reply STOP to opt out. Reply HELP for help. Consent is not a condition of purchase. Your mobile information will not be sold or shared with third parties for promotional or marketing purposes." Once the information is entered into the system, the user receives a confirmation SMS: "Thank you for signing up for SMS updates from Pinnacle Software Development Inc. Msg freq may vary. Std msg & data rates apply. Reply STOP to opt out, HELP for help." Link to paper form: https://www.pinnacle.sh/opt-in',
      name: "Pinnacle's Account Notifications",
      options: {
        affiliate_marketing: false,
        age_gated: false,
        direct_lending: false,
        embedded_link: "https://www.pinnacle.sh/example",
        embedded_phone: false,
        number_pooling: false
      },
      sample_messages: ["Pinnacle Software Development Inc.: We're here to help. Visit https://pinnacle.sh or call 877-389-0460. Msg&data rates may apply. Reply STOP to cancel.", "Pinnacle Software Development Inc.: You're enrolled in account & security alerts. Msg&data rates may apply. Message frequency varies. Reply HELP for help, STOP to cancel. Terms: https://pinnacle.sh/terms/ Privacy: https://pinnacle.sh/privacy/", "Pinnacle Software Development Inc.: An update has been made to your account. Read it in the portal.", "Pinnacle Software Development Inc.: We received your message. A team member will reply shortly. For immediate help call 877-389-0460. Msg&data rates may apply. Reply STOP to cancel."],
      use_case: {
        sub: %w[ACCOUNT_NOTIFICATION CUSTOMER_CARE SECURITY_ALERT],
        value: "MIXED"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.dlc.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/dlc",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_dlc_validate_with_wiremock
    test_id = "campaigns.dlc.validate.0"

    @client.campaigns.dlc.validate(
      additional_info: "Please validate this DLC campaign for 10DLC compliance",
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.dlc.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/dlc/validate",
      query_params: nil,
      expected: 1
    )
  end
end
