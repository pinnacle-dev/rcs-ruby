# frozen_string_literal: true

module Pinnacle
  module Messages
    module Sms
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Send a SMS message immediately or schedule it for future delivery.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Messages::Sms::Types::Sms]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Messages::Sms::Types::SmsSendResponse]
        def send_(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/send/sms",
            body: Pinnacle::Messages::Sms::Types::Sms.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Messages::Sms::Types::SmsSendResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Validate SMS message content without sending it.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Types::SmsContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::SmsValidationResult]
        def validate(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/validate/sms",
            body: Pinnacle::Types::SmsContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::SmsValidationResult.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
