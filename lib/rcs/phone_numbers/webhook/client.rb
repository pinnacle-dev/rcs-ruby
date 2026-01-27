# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Webhook
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Connect a webhook to your phone number to receive real-time notifications for incoming messages, delivery
        # status updates, and other communication events.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Types::AttachWebhookParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :phone
        #
        # @return [Rcs::Types::ConfiguredWebhook]
        def attach(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "phone-numbers/#{params[:phone]}/attach-webhook",
            body: Rcs::Types::AttachWebhookParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::ConfiguredWebhook.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Disconnect a webhook from your phone number to stop receiving event notifications for that specific number.
        # <br>
        #
        # The webhook configuration itself remains intact and available for use with other phone numbers.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :phone
        # @option params [String] :webhook_id
        #
        # @return [Rcs::Types::DetachedWebhookInfo]
        def detach(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "phone-numbers/#{params[:phone]}/detach-webhook/#{params[:webhook_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::DetachedWebhookInfo.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
