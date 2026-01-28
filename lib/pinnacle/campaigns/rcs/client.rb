# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Generate campaign details based off existing campaign and the brand it's connected to.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Types::AutofillCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
        def autofill(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/rcs/autofill",
            body: Pinnacle::Types::AutofillCampaignParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve RCS campaign.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :campaign_id
        #
        # @return [Pinnacle::Types::ExtendedRcsCampaign]
        def get(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "campaigns/rcs/#{params[:campaign_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ExtendedRcsCampaign.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Submit your RCS campaign for approval and activation with carriers.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :campaign_id
        #
        # @return [Pinnacle::Types::CampaignSubmissionResult]
        def submit(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/rcs/submit/#{params[:campaign_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::CampaignSubmissionResult.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a new RCS campaign or update an existing one.
        #
        # <Note>
        # **To create a new campaign:** Omit `campaignId` — one will be generated automatically.
        #
        # **Before you start:** Create a [brand](/api-reference/brands/upsert) first — you'll need its `id` for the
        # [`brand`](#request.body.brand) field.
        #
        # All fields are **required** unless specified otherwise, and will be validated when
        # [submitted](/api-reference/campaigns/rcs/submit).
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Campaigns::Rcs::Types::UpsertRcsCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::ExtendedRcsCampaign]
        def upsert(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[agent brand campaign_id expected_agent_responses links use_case opt_in_terms_and_conditions messaging_type carrier_description keywords traffic agent_triggers interaction_description is_conversational cta_language demo_trigger]
          body_bag = params.slice(*body_prop_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/rcs",
            body: Pinnacle::Campaigns::Rcs::Types::UpsertRcsCampaignParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ExtendedRcsCampaign.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Validate your RCS campaign configuration against carrier requirements and compliance rules.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Types::ValidateCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::CampaignValidationResult]
        def validate(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/rcs/validate",
            body: Pinnacle::Types::ValidateCampaignParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::CampaignValidationResult.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
