# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/autofill_campaign_params"
require_relative "types/toll_free_autofill_response"
require_relative "../../types/toll_free_campaign_with_extended_brand_and_status"
require_relative "../../types/campaign_submission_result"
require_relative "../../types/message_volume_enum"
require_relative "types/upsert_toll_free_schema_opt_in"
require_relative "types/upsert_toll_free_schema_use_case"
require_relative "../../types/validate_campaign_params"
require_relative "../../types/campaign_validation_result"
require "async"

module Pinnacle
  module Campaigns
    class TollFreeClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Campaigns::TollFreeClient]
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
      # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.autofill(request: { additional_info: "Please autofill missing campaign fields using my brand profile", campaign_id: "dlc_1234567890" })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/autofill"
        end
        Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse.from_json(json_object: response.body)
      end

      # Retrieve Toll-Free campaign.
      #
      # @param campaign_id [String] Unique identifier of toll-free campaign. Must begin with the prefix `tf_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.get(campaign_id: "tf_1234567890")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/#{campaign_id}"
        end
        Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
      end

      # Submit your toll-free campaign for approval and activation with carriers.
      #
      # @param campaign_id [String] Unique identifier of the toll-free campaign to submit. Must begin with the
      #  prefix `tf_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.submit(campaign_id: "tf_1234567890")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/submit/#{campaign_id}"
        end
        Pinnacle::Types::CampaignSubmissionResult.from_json(json_object: response.body)
      end

      # Create a new toll-free campaign or updates an existing one.<br>
      #  Omit campaignId to create a campaign.
      #
      # @param brand [String] Brand id. This identifier is a string that always begins with the prefix `b_`,
      #  for example: `b_1234567890`.
      # @param campaign_id [String] Unique identifier for the campaign. This identifier is a string that always
      #  begins with the prefix `tf_`, for example: `tf_1234567890`.
      # @param monthly_volume [Pinnacle::Types::MessageVolumeEnum]
      # @param name [String] Display name of the campaign.
      # @param opt_in [Hash] Opt-in keyword settings.Request of type Pinnacle::Campaigns::TollFree::Types::UpsertTollFreeSchemaOptIn, as a Hash
      #   * :method_ (Pinnacle::Types::OptInMethodEnum)
      #   * :url (String)
      #   * :workflow_description (String)
      # @param production_message_content [String] Explain message that would be sent.
      # @param use_case [Hash] Use case classification for the campaign.Request of type Pinnacle::Campaigns::TollFree::Types::UpsertTollFreeSchemaUseCase, as a Hash
      #   * :summary (String)
      #   * :value (Pinnacle::Types::TollFreeCampaignUseCaseEnum)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.upsert(
      #    brand: "b_1234567890",
      #    campaign_id: "tf_1234567890",
      #    monthly_volume: ONE_000,
      #    name: "Pinnacle",
      #    opt_in: { method_: DIGITAL, url: "https://www.pinnacle.sh/", workflow_description: "Visit https://www.pinnacle.sh/" },
      #    production_message_content: "Join the Pinnacle workshop tomorrow and send your first RCS!",
      #    use_case: { summary: "Alerts clients about any Pinnacle hosted workshops.", value: WORKSHOP_ALERTS }
      #  )
      def upsert(brand: nil, campaign_id: nil, monthly_volume: nil, name: nil, opt_in: nil,
                 production_message_content: nil, use_case: nil, request_options: nil)
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
            brand: brand,
            campaignId: campaign_id,
            monthlyVolume: monthly_volume,
            name: name,
            optIn: opt_in,
            productionMessageContent: production_message_content,
            useCase: use_case
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free"
        end
        Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
      end

      # Validate your toll-free campaign configuration against carrier requirements and
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
      #  api.campaigns.toll_free.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: "dlc_1234567890" })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/validate"
        end
        Pinnacle::Types::CampaignValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncTollFreeClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Campaigns::AsyncTollFreeClient]
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
      # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.autofill(request: { additional_info: "Please autofill missing campaign fields using my brand profile", campaign_id: "dlc_1234567890" })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/autofill"
          end
          Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse.from_json(json_object: response.body)
        end
      end

      # Retrieve Toll-Free campaign.
      #
      # @param campaign_id [String] Unique identifier of toll-free campaign. Must begin with the prefix `tf_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.get(campaign_id: "tf_1234567890")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/#{campaign_id}"
          end
          Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
        end
      end

      # Submit your toll-free campaign for approval and activation with carriers.
      #
      # @param campaign_id [String] Unique identifier of the toll-free campaign to submit. Must begin with the
      #  prefix `tf_`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::CampaignSubmissionResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.submit(campaign_id: "tf_1234567890")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/submit/#{campaign_id}"
          end
          Pinnacle::Types::CampaignSubmissionResult.from_json(json_object: response.body)
        end
      end

      # Create a new toll-free campaign or updates an existing one.<br>
      #  Omit campaignId to create a campaign.
      #
      # @param brand [String] Brand id. This identifier is a string that always begins with the prefix `b_`,
      #  for example: `b_1234567890`.
      # @param campaign_id [String] Unique identifier for the campaign. This identifier is a string that always
      #  begins with the prefix `tf_`, for example: `tf_1234567890`.
      # @param monthly_volume [Pinnacle::Types::MessageVolumeEnum]
      # @param name [String] Display name of the campaign.
      # @param opt_in [Hash] Opt-in keyword settings.Request of type Pinnacle::Campaigns::TollFree::Types::UpsertTollFreeSchemaOptIn, as a Hash
      #   * :method_ (Pinnacle::Types::OptInMethodEnum)
      #   * :url (String)
      #   * :workflow_description (String)
      # @param production_message_content [String] Explain message that would be sent.
      # @param use_case [Hash] Use case classification for the campaign.Request of type Pinnacle::Campaigns::TollFree::Types::UpsertTollFreeSchemaUseCase, as a Hash
      #   * :summary (String)
      #   * :value (Pinnacle::Types::TollFreeCampaignUseCaseEnum)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.campaigns.toll_free.upsert(
      #    brand: "b_1234567890",
      #    campaign_id: "tf_1234567890",
      #    monthly_volume: ONE_000,
      #    name: "Pinnacle",
      #    opt_in: { method_: DIGITAL, url: "https://www.pinnacle.sh/", workflow_description: "Visit https://www.pinnacle.sh/" },
      #    production_message_content: "Join the Pinnacle workshop tomorrow and send your first RCS!",
      #    use_case: { summary: "Alerts clients about any Pinnacle hosted workshops.", value: WORKSHOP_ALERTS }
      #  )
      def upsert(brand: nil, campaign_id: nil, monthly_volume: nil, name: nil, opt_in: nil,
                 production_message_content: nil, use_case: nil, request_options: nil)
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
              brand: brand,
              campaignId: campaign_id,
              monthlyVolume: monthly_volume,
              name: name,
              optIn: opt_in,
              productionMessageContent: production_message_content,
              useCase: use_case
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free"
          end
          Pinnacle::Types::TollFreeCampaignWithExtendedBrandAndStatus.from_json(json_object: response.body)
        end
      end

      # Validate your toll-free campaign configuration against carrier requirements and
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
      #  api.campaigns.toll_free.validate(request: { additional_info: "Please validate this DLC campaign for 10DLC compliance", campaign_id: "dlc_1234567890" })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/campaigns/toll-free/validate"
          end
          Pinnacle::Types::CampaignValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
