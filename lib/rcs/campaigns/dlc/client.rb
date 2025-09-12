# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/autofill_campaign_params"
require_relative "../../types/autofill_dlc_campaign_response"
require_relative "../../types/dlc_campaign_with_extended_brand_and_status"
require_relative "../../types/campaign_submission_result"
require_relative "types/upsert_dlc_schema_keywords"
require_relative "types/upsert_dlc_schema_links"
require_relative "types/upsert_dlc_schema_options"
require_relative "types/upsert_dlc_schema_use_case"
require_relative "../../types/validate_campaign_params"
require_relative "../../types/campaign_validation_result"
require "async"

module Pinnacle
  module Campaigns
    class DlcClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Campaigns::DlcClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Generate campaign details based off existing campaign and the brand it's
      #  connected to.
      #
      # @param request [Hash] Request of type Pinnacle::AutofillCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::AutofillDlcCampaignResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.autofill(request: { additional_info: "Please autofill missing DLC campaign fields using my brand profile", campaign_id: 161 })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/autofill"
        end
        Pinnacle::AutofillDlcCampaignResponse.from_json(json_object: response.body)
      end

      # Retrieve DLC campaign.
      #
      # @param campaign_id [Integer] Unique identifier of the DLC campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::DlcCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.get(campaign_id: 28)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/#{campaign_id}"
        end
        Pinnacle::DlcCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
      end

      # Submit your DLC campaign for approval and activation with carriers.
      #
      # @param campaign_id [Integer] Unique identifier of the DLC campaign to submit.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.submit(campaign_id: 161)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/submit/#{campaign_id}"
        end
        Pinnacle::CampaignSubmissionResult.from_json(json_object: response.body)
      end

      # Create a new DLC campaign or updates an existing one. <br>
      #  Omit campaignId to create a campaign.
      #
      # @param auto_renew [Boolean] Whether the campaign renews automatically.
      # @param brand [Integer] Brand id.
      # @param campaign_id [Integer] Unique identifier for the campaign.
      # @param description [String] Description of the campaign.
      # @param keywords [Hash] Keyword response configuration.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaKeywords, as a Hash
      #   * :help (Hash)
      #     * :message (String)
      #     * :values (Array<String>)
      #   * :opt_in (Hash)
      #     * :message (String)
      #     * :values (Array<String>)
      #   * :opt_out (Hash)
      #     * :message (String)
      #     * :values (Array<String>)
      # @param links [Hash] Legal documentation links.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaLinks, as a Hash
      #   * :privacy_policy (String)
      #   * :terms_of_service (String)
      # @param message_flow [String] Describe the flow of how users will opt in to this campaign.
      # @param name [String] Display name of the campaign.
      # @param options [Hash] Campaign configuration options.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaOptions, as a Hash
      #   * :affiliate_marketing (Boolean)
      #   * :age_gated (Boolean)
      #   * :direct_lending (Boolean)
      #   * :embedded_link (String)
      #   * :embedded_phone (Boolean)
      #   * :number_pooling (Boolean)
      # @param sample_messages [Array<String>] Example messages for the campaign.
      # @param use_case [Hash] Use case for the campaign.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaUseCase, as a Hash
      #   * :sub (Array<Pinnacle::SubUseCaseEnum>)
      #   * :value (Pinnacle::DlcCampaignUseCaseEnum)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::DlcCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.upsert(
      #    auto_renew: true,
      #    brand: 1,
      #    campaign_id: 161,
      #    keywords: { help: { message: "Reply HELP for assistance, STOP to opt-out", values: ["HELP", "INFO", "SUPPORT"] }, opt_in: { message: "Welcome! You're now subscribed to Pinnacle.", values: ["JOIN", "START", "SUBSCRIBE"] }, opt_out: { message: "You've been unsubscribed. Reply START to rejoin.", values: ["STOP", "QUIT", "UNSUBSCRIBE"] } },
      #    links: { privacy_policy: "https://www.pinnacle.sh/privacy", terms_of_service: "https://www.pinnacle.sh/terms" },
      #    message_flow: "Customer initiates -> Automated response -> Agent follow-up if needed",
      #    name: "Account Notifications",
      #    options: { affiliate_marketing: false, age_gated: false, direct_lending: false, embedded_link: "https://www.pinnacle.sh/example", embedded_phone: false, number_pooling: false },
      #    sample_messages: ["Security alert: Unusual login detected from new device."],
      #    use_case: { sub: [FRAUD_ALERT], value: ACCOUNT_NOTIFICATION }
      #  )
      def upsert(auto_renew: nil, brand: nil, campaign_id: nil, description: nil, keywords: nil, links: nil,
                 message_flow: nil, name: nil, options: nil, sample_messages: nil, use_case: nil, request_options: nil)
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
            autoRenew: auto_renew,
            brand: brand,
            campaignId: campaign_id,
            description: description,
            keywords: keywords,
            links: links,
            messageFlow: message_flow,
            name: name,
            options: options,
            sampleMessages: sample_messages,
            useCase: use_case
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc"
        end
        Pinnacle::DlcCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
      end

      # Validate your DLC campaign configuration against carrier requirements and
      #  compliance rules.
      #
      # @param request [Hash] Request of type Pinnacle::ValidateCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::CampaignValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: 161 })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/validate"
        end
        Pinnacle::CampaignValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncDlcClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Campaigns::AsyncDlcClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Generate campaign details based off existing campaign and the brand it's
      #  connected to.
      #
      # @param request [Hash] Request of type Pinnacle::AutofillCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::AutofillDlcCampaignResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.autofill(request: { additional_info: "Please autofill missing DLC campaign fields using my brand profile", campaign_id: 161 })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/autofill"
          end
          Pinnacle::AutofillDlcCampaignResponse.from_json(json_object: response.body)
        end
      end

      # Retrieve DLC campaign.
      #
      # @param campaign_id [Integer] Unique identifier of the DLC campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::DlcCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.get(campaign_id: 28)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/#{campaign_id}"
          end
          Pinnacle::DlcCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
        end
      end

      # Submit your DLC campaign for approval and activation with carriers.
      #
      # @param campaign_id [Integer] Unique identifier of the DLC campaign to submit.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.submit(campaign_id: 161)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/submit/#{campaign_id}"
          end
          Pinnacle::CampaignSubmissionResult.from_json(json_object: response.body)
        end
      end

      # Create a new DLC campaign or updates an existing one. <br>
      #  Omit campaignId to create a campaign.
      #
      # @param auto_renew [Boolean] Whether the campaign renews automatically.
      # @param brand [Integer] Brand id.
      # @param campaign_id [Integer] Unique identifier for the campaign.
      # @param description [String] Description of the campaign.
      # @param keywords [Hash] Keyword response configuration.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaKeywords, as a Hash
      #   * :help (Hash)
      #     * :message (String)
      #     * :values (Array<String>)
      #   * :opt_in (Hash)
      #     * :message (String)
      #     * :values (Array<String>)
      #   * :opt_out (Hash)
      #     * :message (String)
      #     * :values (Array<String>)
      # @param links [Hash] Legal documentation links.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaLinks, as a Hash
      #   * :privacy_policy (String)
      #   * :terms_of_service (String)
      # @param message_flow [String] Describe the flow of how users will opt in to this campaign.
      # @param name [String] Display name of the campaign.
      # @param options [Hash] Campaign configuration options.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaOptions, as a Hash
      #   * :affiliate_marketing (Boolean)
      #   * :age_gated (Boolean)
      #   * :direct_lending (Boolean)
      #   * :embedded_link (String)
      #   * :embedded_phone (Boolean)
      #   * :number_pooling (Boolean)
      # @param sample_messages [Array<String>] Example messages for the campaign.
      # @param use_case [Hash] Use case for the campaign.Request of type Pinnacle::Campaigns::Dlc::UpsertDlcSchemaUseCase, as a Hash
      #   * :sub (Array<Pinnacle::SubUseCaseEnum>)
      #   * :value (Pinnacle::DlcCampaignUseCaseEnum)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::DlcCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.upsert(
      #    auto_renew: true,
      #    brand: 1,
      #    campaign_id: 161,
      #    keywords: { help: { message: "Reply HELP for assistance, STOP to opt-out", values: ["HELP", "INFO", "SUPPORT"] }, opt_in: { message: "Welcome! You're now subscribed to Pinnacle.", values: ["JOIN", "START", "SUBSCRIBE"] }, opt_out: { message: "You've been unsubscribed. Reply START to rejoin.", values: ["STOP", "QUIT", "UNSUBSCRIBE"] } },
      #    links: { privacy_policy: "https://www.pinnacle.sh/privacy", terms_of_service: "https://www.pinnacle.sh/terms" },
      #    message_flow: "Customer initiates -> Automated response -> Agent follow-up if needed",
      #    name: "Account Notifications",
      #    options: { affiliate_marketing: false, age_gated: false, direct_lending: false, embedded_link: "https://www.pinnacle.sh/example", embedded_phone: false, number_pooling: false },
      #    sample_messages: ["Security alert: Unusual login detected from new device."],
      #    use_case: { sub: [FRAUD_ALERT], value: ACCOUNT_NOTIFICATION }
      #  )
      def upsert(auto_renew: nil, brand: nil, campaign_id: nil, description: nil, keywords: nil, links: nil,
                 message_flow: nil, name: nil, options: nil, sample_messages: nil, use_case: nil, request_options: nil)
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
              autoRenew: auto_renew,
              brand: brand,
              campaignId: campaign_id,
              description: description,
              keywords: keywords,
              links: links,
              messageFlow: message_flow,
              name: name,
              options: options,
              sampleMessages: sample_messages,
              useCase: use_case
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc"
          end
          Pinnacle::DlcCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
        end
      end

      # Validate your DLC campaign configuration against carrier requirements and
      #  compliance rules.
      #
      # @param request [Hash] Request of type Pinnacle::ValidateCampaignParams, as a Hash
      #   * :additional_info (String)
      #   * :campaign_id (Integer)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::CampaignValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.dlc.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: 161 })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/dlc/validate"
          end
          Pinnacle::CampaignValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
