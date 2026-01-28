# frozen_string_literal: true

require_relative "wiremock_test_case"

class CampaignsRcsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_campaigns_rcs_autofill_with_wiremock
    test_id = "campaigns.rcs.autofill.0"

    @client.campaigns.rcs.autofill(
      additional_info: "Please autofill missing campaign fields using my brand profile",
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.rcs.autofill.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/rcs/autofill",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_rcs_get_with_wiremock
    test_id = "campaigns.rcs.get.0"

    @client.campaigns.rcs.get(
      campaign_id: "rcs_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.rcs.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/campaigns/rcs/rcs_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_rcs_submit_with_wiremock
    test_id = "campaigns.rcs.submit.0"

    @client.campaigns.rcs.submit(
      campaign_id: "rcs_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.rcs.submit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/rcs/submit/rcs_1234567890",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_rcs_upsert_with_wiremock
    test_id = "campaigns.rcs.upsert.0"

    @client.campaigns.rcs.upsert(
      agent: {
        color: "#000000",
        description: "Experience the power of RCS messaging with interactive demos. Test rich features like carousels, suggested replies, and media sharing. Get started with our developer-friendly APIs.",
        emails: [{
          email: "founders@trypinnacle.app",
          label: "Email Us"
        }],
        hero_url: "https://pncl.to/D6pDSqGxqgfbCfQmw4gXdnlHu4uSB4",
        icon_url: "https://pncl.to/mq_tdIDenRb5eYpJiM8-3THCaUBrZP",
        name: "Pinnacle - RCS Demo",
        phones: [{
          label: "Contact us directly",
          phone: "+14154467821"
        }],
        websites: [{
          label: "Get started with Pinnacle",
          url: "https://www.trypinnacle.app/"
        }]
      },
      brand: "b_1234567890",
      campaign_id: "rcs_1234567890",
      expected_agent_responses: ["Here are the things I can help you with.", "I can assist you with booking an appointment, or you may choose to book manually.", "Here are the available times to connect with a representative tomorrow.", "Your appointment has been scheduled."],
      links: {
        privacy_policy: "https://www.trypinnacle.app/privacy",
        terms_of_service: "https://www.trypinnacle.app/terms"
      },
      use_case: {
        behavior: 'Pinnacle is a developer-focused RCS assistant that helps teams design, test, and optimize rich messaging experiences across SMS, MMS, and RCS. The agent acts as both an “onboarding guide” for new customers and a “best-practices coach” for existing teams exploring higher-value RCS workflows like rich cards, carousels, and suggested actions.<br>
        The agent delivers a mix of operational updates and educational content (2–6 messages/month). Content includes important platform notices (e.g., deliverability or throughput changes), implementation tips with sample RCS templates, and personalized recommendations on how to upgrade existing SMS campaigns into richer, higher-converting RCS conversations.
        ',
        value: "OTHER"
      },
      opt_in_terms_and_conditions: 'We ensure consent through an explicit opt-in process that follows 10DLC best practices.Users must agree to receive messages from Pinnacle before the agent sends them any messages.<br>
      Users agree to these messages by signing an opt-in paper form that they can be found online at https://www.pinnacle.sh/opt-in. We only send messages once users have filled out the form and submitted it to us via email or through the dashboard.
      ',
      messaging_type: "MULTI_USE",
      carrier_description: "Demonstrate the power of RCS to medium and large companies already sending massive SMS/MMS volumes through our platform. These clients send conversational messages in industries such as commerce, appointments, and customer support.",
      keywords: {
        help: {
          message: "Email founders@trypinnacle.app for support.",
          keywords: %w[HELP SUPPORT]
        },
        opt_in: {
          message: "Welcome back to Pinnacle!<br>
          🔔 You're now subscribed to Pinnacle - RCS Demo and will continue receiving important updates and news. Feel free to contact this us at any time for help.<br>
          Reply STOP to opt out and HELP for support. Message & rates may apply.
          ",
          keywords: %w[START SUBSCRIBE]
        },
        opt_out: {
          message: "You've been unsubscribed from Pinnacle - RCS Demo and will no longer receive notifications. If you ever change your mind, reply START or SUBSCRIBE to rejoin anytime.",
          keywords: %w[STOP UNSUBSCRIBE END]
        }
      },
      traffic: {
        monthly_website: 10_000,
        monthly_rcs_estimate: 10_000
      },
      agent_triggers: "The agent sends the first message when the user subscribes to Pinnacle. Messages are based on user actions such as pressing suggestion buttons. External triggers such as reminders can be setup by users in advance for a later time.",
      interaction_description: "The agent's primary interaction will be customer service — helping users with questions, troubleshooting issues, and providing quick assistance through chat. Other interactions include appointment management and sending notifications to the user.",
      is_conversational: true,
      cta_language: "By checking this box and submitting this form, you consent to receive transactional text messages for support, appointment, and reminder messages from Pinnacle Software Development Inc. Reply STOP to opt out. Reply HELP for help. Standard message and data rates may apply. Message frequency may vary. View our Terms and Conditions at https://www.pinnacle.sh/terms. View our Privacy Policy at https://www.pinnacle.sh/privacy.",
      demo_trigger: 'Text "START" to trigger the flow.',
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.rcs.upsert.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/rcs",
      query_params: nil,
      expected: 1
    )
  end

  def test_campaigns_rcs_validate_with_wiremock
    test_id = "campaigns.rcs.validate.0"

    @client.campaigns.rcs.validate(
      additional_info: "Please validate this DLC campaign for 10DLC compliance",
      campaign_id: "dlc_1234567890",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "campaigns.rcs.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/campaigns/rcs/validate",
      query_params: nil,
      expected: 1
    )
  end
end
