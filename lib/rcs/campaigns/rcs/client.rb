# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/autofill_campaign_params"
require_relative "types/rcs_autofill_response"
require_relative "../../types/extended_rcs_campaign"
require_relative "../../types/campaign_submission_result"
require_relative "types/upsert_rcs_agent"
require_relative "types/upsert_rcs_links"
require_relative "types/upsert_rcs_opt_in"
require_relative "types/upsert_rcs_opt_out"
require_relative "types/upsert_rcs_use_case"
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
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.autofill(request: { additional_info: "Please autofill missing DLC campaign fields using my brand profile", campaign_id: 161 })
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
      # @param campaign_id [Integer] Unique identifier of the RCS campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.get(campaign_id: 161)
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
      # @param campaign_id [Integer] Unique identifier of the RCS campaign to retrieve.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.submit(campaign_id: 161)
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
      # @param agent [Hash] Create an agent for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsAgent, as a Hash
      #   * :color (String)
      #   * :description (String)
      #   * :emails (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentEmail>)
      #   * :hero_url (String)
      #   * :icon_url (String)
      #   * :name (String)
      #   * :phones (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentPhone>)
      #   * :websites (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentWebsite>)
      # @param brand [Integer] Unique identifier for the brand.
      # @param campaign_id [Integer] Unique identifier for the campaign.
      # @param expected_agent_responses [Array<String>] List of what the agent might say to users (1-5 required).
      # @param links [Hash] Legal documentation links.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsLinks, as a Hash
      #   * :privacy_policy (String)
      #   * :terms_of_service (String)
      # @param opt_in [Hash] Opt-in configuration.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsOptIn, as a Hash
      #   * :method_ (Pinnacle::Types::RcsCampaignOptInMethodEnum)
      #   * :terms_and_conditions (String)
      # @param opt_out [Hash] Opt-out configuration.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsOptOut, as a Hash
      #   * :description (String)
      #   * :keywords (Array<String>)
      # @param use_case [Hash] Use case classification for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsUseCase, as a Hash
      #   * :behavior (String)
      #   * :value (Pinnacle::Types::RcsCampaignUseCaseEnum)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.upsert(
      #    agent: { color: "#000000", description: "Engaging campaigns with RBM – next-gen SMS marketing with rich content and better analytics.", emails: [{ email: "founders@trypinnacle.app", label: "Email Us" }], hero_url: "https://agent-logos.storage.googleapis.com/_/m0bk9mmw7kfynqiKSPfsaoc6", icon_url: "https://agent-logos.storage.googleapis.com/_/m0bk9gvlDunZEw1krfruZmw3", name: "Pinnacle Software Development", phones: [{ label: "Contact us directly", phone: "+14154467821" }], websites: [{ label: "Get started with Pinnacle", url: "https://www.trypinnacle.app/" }] },
      #    brand: 2,
      #    expected_agent_responses: ["Here are the things I can help you with.", "I can assist you with booking an appointment, or you may choose to book manually.", "Here are the available times to connect with a representative tomorrow.", "Your appointment has been scheduled."],
      #    links: { privacy_policy: "https://www.trypinnacle.app/privacy", terms_of_service: "https://www.trypinnacle.app/terms" },
      #    opt_in: { method_: WEBSITE, terms_and_conditions: "Would you like to subscribe to Pinnacle?" },
      #    opt_out: { description: "Reply STOP to opt-out anytime.", keywords: ["STOP", "UNSUBSCRIBE", "END"] },
      #    use_case: { behavior: "Acts as a customer service representative.", value: OTHER }
      #  )
      def upsert(agent: nil, brand: nil, campaign_id: nil, expected_agent_responses: nil, links: nil, opt_in: nil,
                 opt_out: nil, use_case: nil, request_options: nil)
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
            optIn: opt_in,
            optOut: opt_out,
            useCase: use_case
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
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: 161 })
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
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.autofill(request: { additional_info: "Please autofill missing DLC campaign fields using my brand profile", campaign_id: 161 })
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
      # @param campaign_id [Integer] Unique identifier of the RCS campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.get(campaign_id: 161)
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
      # @param campaign_id [Integer] Unique identifier of the RCS campaign to retrieve.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.submit(campaign_id: 161)
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
      # @param agent [Hash] Create an agent for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsAgent, as a Hash
      #   * :color (String)
      #   * :description (String)
      #   * :emails (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentEmail>)
      #   * :hero_url (String)
      #   * :icon_url (String)
      #   * :name (String)
      #   * :phones (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentPhone>)
      #   * :websites (Array<Pinnacle::Campaigns::Rcs::Types::RcsAgentWebsite>)
      # @param brand [Integer] Unique identifier for the brand.
      # @param campaign_id [Integer] Unique identifier for the campaign.
      # @param expected_agent_responses [Array<String>] List of what the agent might say to users (1-5 required).
      # @param links [Hash] Legal documentation links.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsLinks, as a Hash
      #   * :privacy_policy (String)
      #   * :terms_of_service (String)
      # @param opt_in [Hash] Opt-in configuration.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsOptIn, as a Hash
      #   * :method_ (Pinnacle::Types::RcsCampaignOptInMethodEnum)
      #   * :terms_and_conditions (String)
      # @param opt_out [Hash] Opt-out configuration.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsOptOut, as a Hash
      #   * :description (String)
      #   * :keywords (Array<String>)
      # @param use_case [Hash] Use case classification for the campaign.Request of type Pinnacle::Campaigns::Rcs::Types::UpsertRcsUseCase, as a Hash
      #   * :behavior (String)
      #   * :value (Pinnacle::Types::RcsCampaignUseCaseEnum)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.upsert(
      #    agent: { color: "#000000", description: "Engaging campaigns with RBM – next-gen SMS marketing with rich content and better analytics.", emails: [{ email: "founders@trypinnacle.app", label: "Email Us" }], hero_url: "https://agent-logos.storage.googleapis.com/_/m0bk9mmw7kfynqiKSPfsaoc6", icon_url: "https://agent-logos.storage.googleapis.com/_/m0bk9gvlDunZEw1krfruZmw3", name: "Pinnacle Software Development", phones: [{ label: "Contact us directly", phone: "+14154467821" }], websites: [{ label: "Get started with Pinnacle", url: "https://www.trypinnacle.app/" }] },
      #    brand: 2,
      #    expected_agent_responses: ["Here are the things I can help you with.", "I can assist you with booking an appointment, or you may choose to book manually.", "Here are the available times to connect with a representative tomorrow.", "Your appointment has been scheduled."],
      #    links: { privacy_policy: "https://www.trypinnacle.app/privacy", terms_of_service: "https://www.trypinnacle.app/terms" },
      #    opt_in: { method_: WEBSITE, terms_and_conditions: "Would you like to subscribe to Pinnacle?" },
      #    opt_out: { description: "Reply STOP to opt-out anytime.", keywords: ["STOP", "UNSUBSCRIBE", "END"] },
      #    use_case: { behavior: "Acts as a customer service representative.", value: OTHER }
      #  )
      def upsert(agent: nil, brand: nil, campaign_id: nil, expected_agent_responses: nil, links: nil, opt_in: nil,
                 opt_out: nil, use_case: nil, request_options: nil)
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
              optIn: opt_in,
              optOut: opt_out,
              useCase: use_case
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
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.rcs.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: 161 })
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
