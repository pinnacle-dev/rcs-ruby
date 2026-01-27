# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Campaign
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Link a phone number to a specific campaign. Phone numbers must be linked to a campaign to send messages.
        #
        # @param request_options [Hash]
        # @param params [Rcs::PhoneNumbers::Campaign::Types::AttachCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::AttachedPhoneNumberResult]
        def attach(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[phones campaign_type campaign_id]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "phone-numbers/attach-campaign",
            body: Rcs::PhoneNumbers::Campaign::Types::AttachCampaignParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::AttachedPhoneNumberResult.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Remove the association between a phone number and its attached campaign.
        #
        # @param request_options [Hash]
        # @param params [Rcs::PhoneNumbers::Campaign::Types::DetachCampaignParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::DetachedPhoneNumberResult]
        def detach(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[phones]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "phone-numbers/detach-campaign",
            body: Rcs::PhoneNumbers::Campaign::Types::DetachCampaignParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::DetachedPhoneNumberResult.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
