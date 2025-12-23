# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/autofill_campaign_params"
require_relative "types/rcs_autofill_response"
require_relative "../../types/extended_rcs_campaign"
require_relative "../../types/campaign_submission_result"
require_relative "types/rcs_agent"
require_relative "types/rcs_links"
require_relative "types/rcs_use_case"
require_relative "../../types/rcs_messaging_type_enum"
require_relative "types/rcs_campaign_keywords"
require_relative "types/rcs_campaign_traffic"
require_relative "../../types/validate_campaign_params"
require_relative "../../types/campaign_validation_result"
require "async"

module Pinnacle
  module Campaigns
    class RcsClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Campaigns::RcsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Generate campaign details based off existing campaign and the brand it's
      #  connected to.
      #
      # @param request [Hash] Request of type Pinnacle::Types::AutofillCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.autofill(request: { additional_info: "Please autofill missing campaign fields using my brand profile", campaign_id: "dlc_1234567890" })
      def autofill(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/autofill"
        end
        Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse.from_json(json_object: response.body)
      end

      # Retrieve RCS campaign.
      #
      # @param campaign_id [String] Unique identifier of the RCS campaign. Must begin with the prefix `rcs_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.get(campaign_id: "rcs_1234567890")
      def get(campaign_id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/#{campaign_id}"
        end
        Pinnacle::Types::ExtendedRcsCampaign.from_json(json_object: response.body)
      end

      # Submit your RCS campaign for approval and activation with carriers.
      #
      # @param campaign_id [String] Unique identifier of the RCS campaign to retrieve. Must begin with the prefix
      #  `rcs_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.submit(campaign_id: "rcs_1234567890")
      def submit(campaign_id:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/submit/#{campaign_id}"
        end
        Pinnacle::Types::CampaignSubmissionResult.from_json(json_object: response.body)
      end

      # Create a new RCS campaign or updates an existing one. <br>
      #  Omit campaignId to create a campaign.
      #
      # @param agent [Hash] Create an agent for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::RcsAgent, as a Hash
      #   * :color (String)
      #   * :description (String)
      #   * :emails (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentEmail>)
      #   * :hero_url (String)
      #   * :icon_url (String)
      #   * :name (String)
      #   * :phones (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentPhone>)
      #   * :websites (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentWebsite>)
      # @param brand [String] Unique identifier for the brand.
      # @param campaign_id [String] Unique identifier for the campaign.
      # @param expected_agent_responses [Array<String>] List of what the agent might say to users (1-5 required).
      # @param links [Hash] Legal documentation links.Request of type Pinnacle::Campaigns::Rcs::Types::RcsLinks, as a Hash
      #   * :privacy_policy (String)
      #   * :terms_of_service (String)
      # @param use_case [Hash] Use case classification for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::RcsUseCase, as a Hash
      #   * :behavior (String)
      #   * :value (Pinnacle::Types::RcsCampaignUseCaseEnum)
      # @param opt_in_terms_and_conditions [String] Details on how opt-in is acquired. If it is done through a website or app,
      #  provide the link.
      # @param messaging_type [Pinnacle::Types::RcsMessagingTypeEnum]
      # @param carrier_description [String] Description of the agent's purpose, shown to carriers for approval.
      # @param keywords [Hash] Request of type Pinnacle::Campaigns::Rcs::Types::RcsCampaignKeywords, as a Hash
      #   * :help (Hash)
      #     * :message (String)
      #     * :keywords (Array<String>)
      #   * :opt_in (Hash)
      #     * :message (String)
      #     * :keywords (Array<String>)
      #   * :opt_out (Hash)
      #     * :message (String)
      #     * :keywords (Array<String>)
      # @param traffic [Hash] Request of type Pinnacle::Campaigns::Rcs::Types::RcsCampaignTraffic, as a Hash
      #   * :monthly_website (Integer)
      #   * :monthly_rcs_estimate (Integer)
      # @param agent_triggers [String] Explanation of how the agent is triggered. This includes how the first message
      #  is delivered, whether messages follow a schedule or triggered by user actions,
      #  and any external triggers.
      # @param interaction_description [String] Description of all agent interactions.
      # @param is_conversational [Boolean] Whether the agent supports conversational flows or respond to P2A messages from
      #  the users. Set to false for one-way messages from agent to user.
      # @param cta_language [String] Required text that appears next to the opt-in checkbox for your opt-in form.
      #  This checkbox has to be unchecked by default. The text should meet the US CTIA
      #  requirements and is usually in the following format: <br>
      #  [Program description of the company sending the messages and what type of
      #  messages are being sent]. Msg&data rates may apply. [Message frequency: How
      #  frequently messages are sent]. [Privacy statement or link to privacy policy].
      #  [Link to full mobile
      #  T&Cs page].
      # @param demo_trigger [String] Instructions on how an external reviewer can trigger messages and an example
      #  flow from the agent. This is usually an inbound text message to the agent that
      #  will start a flow of messages between the agent and the user.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.upsert(
      #    agent: { color: "#000000", description: "Experience the power of RCS messaging with interactive demos. Test rich features like carousels, suggested replies, and media sharing. Get started with our developer-friendly APIs.", emails: [{ email: "founders@trypinnacle.app", label: "Email Us" }], hero_url: "https://pncl.to/D6pDSqGxqgfbCfQmw4gXdnlHu4uSB4", icon_url: "https://pncl.to/mq_tdIDenRb5eYpJiM8-3THCaUBrZP", name: "Pinnacle - RCS Demo", phones: [{ label: "Contact us directly", phone: "+14154467821" }], websites: [{ label: "Get started with Pinnacle", url: "https://www.trypinnacle.app/" }] },
      #    brand: "b_1234567890",
      #    campaign_id: "rcs_1234567890",
      #    expected_agent_responses: ["Here are the things I can help you with.", "I can assist you with booking an appointment, or you may choose to book manually.", "Here are the available times to connect with a representative tomorrow.", "Your appointment has been scheduled."],
      #    links: { privacy_policy: "https://www.trypinnacle.app/privacy", terms_of_service: "https://www.trypinnacle.app/terms" },
      #    use_case: { behavior: "Pinnacle is a developer-focused RCS assistant that helps teams design, test, and optimize rich messaging experiences across SMS, MMS, and RCS. The agent acts as both an “onboarding guide” for new customers and a “best-practices coach” for existing teams exploring higher-value RCS workflows like rich cards, carousels, and suggested actions.<br>
      #  The agent delivers a mix of operational updates and educational content (2–6 messages/month). Content includes important platform notices (e.g., deliverability or throughput changes), implementation tips with sample RCS templates, and personalized recommendations on how to upgrade existing SMS campaigns into richer, higher-converting RCS conversations.
      #  ", value: OTHER },
      #    opt_in_terms_and_conditions: "We ensure consent through an explicit opt-in process that follows 10DLC best practices.Users must agree to receive messages from Pinnacle before the agent sends them any messages.<br>
      #  Users agree to these messages by signing an opt-in paper form that they can be found online at https://www.pinnacle.sh/opt-in. We only send messages once users have filled out the form and submitted it to us via email or through the dashboard.
      #  ",
      #    messaging_type: MULTI_USE,
      #    carrier_description: "Demonstrate the power of RCS to medium and large companies already sending massive SMS/MMS volumes through our platform. These clients send conversational messages in industries such as commerce, appointments, and customer support.",
      #    keywords: { help: { message: "Email founders@trypinnacle.app for support.", keywords: ["HELP", "SUPPORT"] }, opt_in: { message: "Welcome back to Pinnacle!<br>
      #  🔔 You're now subscribed to Pinnacle - RCS Demo and will continue receiving important updates and news. Feel free to contact this us at any time for help.<br>
      #  Reply STOP to opt out and HELP for support. Message & rates may apply.
      #  ", keywords: ["START", "SUBSCRIBE"] }, opt_out: { message: "You've been unsubscribed from Pinnacle - RCS Demo and will no longer receive notifications. If you ever change your mind, reply START or SUBSCRIBE to rejoin anytime.", keywords: ["STOP", "UNSUBSCRIBE", "END"] } },
      #    traffic: { monthly_website: 10000, monthly_rcs_estimate: 10000 },
      #    agent_triggers: "The agent sends the first message when the user subscribes to Pinnacle. Messages are based on user actions such as pressing suggestion buttons. External triggers such as reminders can be setup by users in advance for a later time.",
      #    interaction_description: "The agent's primary interaction will be customer service — helping users with questions, troubleshooting issues, and providing quick assistance through chat. Other interactions include appointment management and sending notifications to the user.",
      #    is_conversational: true,
      #    cta_language: "By checking this box and submitting this form, you consent to receive transactional text messages for support, appointment, and reminder messages from Pinnacle Software Development Inc. Reply STOP to opt out. Reply HELP for help. Standard message and data rates may apply. Message frequency may vary. View our Terms and Conditions at https://www.pinnacle.sh/terms. View our Privacy Policy at https://www.pinnacle.sh/privacy.",
      #    demo_trigger: "Text "START" to trigger the flow."
      #  )
      def upsert(agent: nil, brand: nil, campaign_id: nil, expected_agent_responses: nil, links: nil, use_case: nil,
                 opt_in_terms_and_conditions: nil, messaging_type: nil, carrier_description: nil, keywords: nil, traffic: nil, agent_triggers: nil, interaction_description: nil, is_conversational: nil, cta_language: nil, demo_trigger: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            agent: agent,
            brand: brand,
            campaignId: campaign_id,
            expectedAgentResponses: expected_agent_responses,
            links: links,
            useCase: use_case,
            optInTermsAndConditions: opt_in_terms_and_conditions,
            messagingType: messaging_type,
            carrierDescription: carrier_description,
            keywords: keywords,
            traffic: traffic,
            agentTriggers: agent_triggers,
            interactionDescription: interaction_description,
            isConversational: is_conversational,
            ctaLanguage: cta_language,
            demoTrigger: demo_trigger
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs"
        end
        Pinnacle::Types::ExtendedRcsCampaign.from_json(json_object: response.body)
      end

      # Validate your RCS campaign configuration against carrier requirements and
      #  compliance rules.
      #
      # @param request [Hash] Request of type Pinnacle::Types::ValidateCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: "dlc_1234567890" })
      def validate(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/validate"
        end
        Pinnacle::Types::CampaignValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncRcsClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Campaigns::AsyncRcsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Generate campaign details based off existing campaign and the brand it's
      #  connected to.
      #
      # @param request [Hash] Request of type Pinnacle::Types::AutofillCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.autofill(request: { additional_info: "Please autofill missing campaign fields using my brand profile", campaign_id: "dlc_1234567890" })
      def autofill(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/autofill"
          end
          Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse.from_json(json_object: response.body)
        end
      end

      # Retrieve RCS campaign.
      #
      # @param campaign_id [String] Unique identifier of the RCS campaign. Must begin with the prefix `rcs_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.get(campaign_id: "rcs_1234567890")
      def get(campaign_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/#{campaign_id}"
          end
          Pinnacle::Types::ExtendedRcsCampaign.from_json(json_object: response.body)
        end
      end

      # Submit your RCS campaign for approval and activation with carriers.
      #
      # @param campaign_id [String] Unique identifier of the RCS campaign to retrieve. Must begin with the prefix
      #  `rcs_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.submit(campaign_id: "rcs_1234567890")
      def submit(campaign_id:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/submit/#{campaign_id}"
          end
          Pinnacle::Types::CampaignSubmissionResult.from_json(json_object: response.body)
        end
      end

      # Create a new RCS campaign or updates an existing one. <br>
      #  Omit campaignId to create a campaign.
      #
      # @param agent [Hash] Create an agent for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::RcsAgent, as a Hash
      #   * :color (String)
      #   * :description (String)
      #   * :emails (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentEmail>)
      #   * :hero_url (String)
      #   * :icon_url (String)
      #   * :name (String)
      #   * :phones (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentPhone>)
      #   * :websites (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentWebsite>)
      # @param brand [String] Unique identifier for the brand.
      # @param campaign_id [String] Unique identifier for the campaign.
      # @param expected_agent_responses [Array<String>] List of what the agent might say to users (1-5 required).
      # @param links [Hash] Legal documentation links.Request of type Pinnacle::Campaigns::Rcs::Types::RcsLinks, as a Hash
      #   * :privacy_policy (String)
      #   * :terms_of_service (String)
      # @param use_case [Hash] Use case classification for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::RcsUseCase, as a Hash
      #   * :behavior (String)
      #   * :value (Pinnacle::Types::RcsCampaignUseCaseEnum)
      # @param opt_in_terms_and_conditions [String] Details on how opt-in is acquired. If it is done through a website or app,
      #  provide the link.
      # @param messaging_type [Pinnacle::Types::RcsMessagingTypeEnum]
      # @param carrier_description [String] Description of the agent's purpose, shown to carriers for approval.
      # @param keywords [Hash] Request of type Pinnacle::Campaigns::Rcs::Types::RcsCampaignKeywords, as a Hash
      #   * :help (Hash)
      #     * :message (String)
      #     * :keywords (Array<String>)
      #   * :opt_in (Hash)
      #     * :message (String)
      #     * :keywords (Array<String>)
      #   * :opt_out (Hash)
      #     * :message (String)
      #     * :keywords (Array<String>)
      # @param traffic [Hash] Request of type Pinnacle::Campaigns::Rcs::Types::RcsCampaignTraffic, as a Hash
      #   * :monthly_website (Integer)
      #   * :monthly_rcs_estimate (Integer)
      # @param agent_triggers [String] Explanation of how the agent is triggered. This includes how the first message
      #  is delivered, whether messages follow a schedule or triggered by user actions,
      #  and any external triggers.
      # @param interaction_description [String] Description of all agent interactions.
      # @param is_conversational [Boolean] Whether the agent supports conversational flows or respond to P2A messages from
      #  the users. Set to false for one-way messages from agent to user.
      # @param cta_language [String] Required text that appears next to the opt-in checkbox for your opt-in form.
      #  This checkbox has to be unchecked by default. The text should meet the US CTIA
      #  requirements and is usually in the following format: <br>
      #  [Program description of the company sending the messages and what type of
      #  messages are being sent]. Msg&data rates may apply. [Message frequency: How
      #  frequently messages are sent]. [Privacy statement or link to privacy policy].
      #  [Link to full mobile
      #  T&Cs page].
      # @param demo_trigger [String] Instructions on how an external reviewer can trigger messages and an example
      #  flow from the agent. This is usually an inbound text message to the agent that
      #  will start a flow of messages between the agent and the user.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.upsert(
      #    agent: { color: "#000000", description: "Experience the power of RCS messaging with interactive demos. Test rich features like carousels, suggested replies, and media sharing. Get started with our developer-friendly APIs.", emails: [{ email: "founders@trypinnacle.app", label: "Email Us" }], hero_url: "https://pncl.to/D6pDSqGxqgfbCfQmw4gXdnlHu4uSB4", icon_url: "https://pncl.to/mq_tdIDenRb5eYpJiM8-3THCaUBrZP", name: "Pinnacle - RCS Demo", phones: [{ label: "Contact us directly", phone: "+14154467821" }], websites: [{ label: "Get started with Pinnacle", url: "https://www.trypinnacle.app/" }] },
      #    brand: "b_1234567890",
      #    campaign_id: "rcs_1234567890",
      #    expected_agent_responses: ["Here are the things I can help you with.", "I can assist you with booking an appointment, or you may choose to book manually.", "Here are the available times to connect with a representative tomorrow.", "Your appointment has been scheduled."],
      #    links: { privacy_policy: "https://www.trypinnacle.app/privacy", terms_of_service: "https://www.trypinnacle.app/terms" },
      #    use_case: { behavior: "Pinnacle is a developer-focused RCS assistant that helps teams design, test, and optimize rich messaging experiences across SMS, MMS, and RCS. The agent acts as both an “onboarding guide” for new customers and a “best-practices coach” for existing teams exploring higher-value RCS workflows like rich cards, carousels, and suggested actions.<br>
      #  The agent delivers a mix of operational updates and educational content (2–6 messages/month). Content includes important platform notices (e.g., deliverability or throughput changes), implementation tips with sample RCS templates, and personalized recommendations on how to upgrade existing SMS campaigns into richer, higher-converting RCS conversations.
      #  ", value: OTHER },
      #    opt_in_terms_and_conditions: "We ensure consent through an explicit opt-in process that follows 10DLC best practices.Users must agree to receive messages from Pinnacle before the agent sends them any messages.<br>
      #  Users agree to these messages by signing an opt-in paper form that they can be found online at https://www.pinnacle.sh/opt-in. We only send messages once users have filled out the form and submitted it to us via email or through the dashboard.
      #  ",
      #    messaging_type: MULTI_USE,
      #    carrier_description: "Demonstrate the power of RCS to medium and large companies already sending massive SMS/MMS volumes through our platform. These clients send conversational messages in industries such as commerce, appointments, and customer support.",
      #    keywords: { help: { message: "Email founders@trypinnacle.app for support.", keywords: ["HELP", "SUPPORT"] }, opt_in: { message: "Welcome back to Pinnacle!<br>
      #  🔔 You're now subscribed to Pinnacle - RCS Demo and will continue receiving important updates and news. Feel free to contact this us at any time for help.<br>
      #  Reply STOP to opt out and HELP for support. Message & rates may apply.
      #  ", keywords: ["START", "SUBSCRIBE"] }, opt_out: { message: "You've been unsubscribed from Pinnacle - RCS Demo and will no longer receive notifications. If you ever change your mind, reply START or SUBSCRIBE to rejoin anytime.", keywords: ["STOP", "UNSUBSCRIBE", "END"] } },
      #    traffic: { monthly_website: 10000, monthly_rcs_estimate: 10000 },
      #    agent_triggers: "The agent sends the first message when the user subscribes to Pinnacle. Messages are based on user actions such as pressing suggestion buttons. External triggers such as reminders can be setup by users in advance for a later time.",
      #    interaction_description: "The agent's primary interaction will be customer service — helping users with questions, troubleshooting issues, and providing quick assistance through chat. Other interactions include appointment management and sending notifications to the user.",
      #    is_conversational: true,
      #    cta_language: "By checking this box and submitting this form, you consent to receive transactional text messages for support, appointment, and reminder messages from Pinnacle Software Development Inc. Reply STOP to opt out. Reply HELP for help. Standard message and data rates may apply. Message frequency may vary. View our Terms and Conditions at https://www.pinnacle.sh/terms. View our Privacy Policy at https://www.pinnacle.sh/privacy.",
      #    demo_trigger: "Text "START" to trigger the flow."
      #  )
      def upsert(agent: nil, brand: nil, campaign_id: nil, expected_agent_responses: nil, links: nil, use_case: nil,
                 opt_in_terms_and_conditions: nil, messaging_type: nil, carrier_description: nil, keywords: nil, traffic: nil, agent_triggers: nil, interaction_description: nil, is_conversational: nil, cta_language: nil, demo_trigger: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              agent: agent,
              brand: brand,
              campaignId: campaign_id,
              expectedAgentResponses: expected_agent_responses,
              links: links,
              useCase: use_case,
              optInTermsAndConditions: opt_in_terms_and_conditions,
              messagingType: messaging_type,
              carrierDescription: carrier_description,
              keywords: keywords,
              traffic: traffic,
              agentTriggers: agent_triggers,
              interactionDescription: interaction_description,
              isConversational: is_conversational,
              ctaLanguage: cta_language,
              demoTrigger: demo_trigger
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs"
          end
          Pinnacle::Types::ExtendedRcsCampaign.from_json(json_object: response.body)
        end
      end

      # Validate your RCS campaign configuration against carrier requirements and
      #  compliance rules.
      #
      # @param request [Hash] Request of type Pinnacle::Types::ValidateCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: "dlc_1234567890" })
      def validate(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/rcs/validate"
          end
          Pinnacle::Types::CampaignValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
