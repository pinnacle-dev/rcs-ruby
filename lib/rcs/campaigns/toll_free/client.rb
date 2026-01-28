# frozen_string_literal: true

module Rcs
  module Campaigns
    module TollFree
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Generate campaign details based off existing campaign and the brand it's connected to.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Types::AutofillCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Campaigns::TollFree::Types::TollFreeAutofillResponse]
        def autofill(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/toll-free/autofill",
            body: Rcs::Types::AutofillCampaignParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Campaigns::TollFree::Types::TollFreeAutofillResponse.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve Toll-Free campaign.
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
        # @return [Rcs::Types::TollFreeCampaignWithExtendedBrandAndStatus]
        def get(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "campaigns/toll-free/#{params[:campaign_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::TollFreeCampaignWithExtendedBrandAndStatus.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Submit your toll-free campaign for approval and activation with carriers.
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
        # @return [Rcs::Types::CampaignSubmissionResult]
        def submit(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/toll-free/submit/#{params[:campaign_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::CampaignSubmissionResult.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a new toll-free campaign or update an existing one.
        #
        # <Note>
        # **To create a new campaign:** Omit `campaignId` — one will be generated automatically.
        #
        # **Before you start:** Create a [brand](/api-reference/brands/upsert) first — you'll need its `id` for the
        # [`brand`](#request.body.brand) field.
        #
        # All fields are **required** unless specified otherwise, and will be validated when
        # [submitted](/api-reference/campaigns/toll-free/submit).
        #
        # **See the response for example values for each field.**
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Rcs::Campaigns::TollFree::Types::UpsertTollFreeCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::TollFreeCampaignWithExtendedBrandAndStatus]
        def upsert(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[brand campaign_id keywords links monthly_volume name opt_in options production_message_content use_case]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/toll-free",
            body: Rcs::Campaigns::TollFree::Types::UpsertTollFreeCampaignParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::TollFreeCampaignWithExtendedBrandAndStatus.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Validate your toll-free campaign configuration against carrier requirements and compliance rules.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Types::ValidateCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::CampaignValidationResult]
        def validate(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "campaigns/toll-free/validate",
            body: Rcs::Types::ValidateCampaignParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::CampaignValidationResult.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
