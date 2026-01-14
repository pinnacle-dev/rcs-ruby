# frozen_string_literal: true

module Pinnacle
  module Audiences
    module Contacts
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Remove contacts from an existing audience. This operation is idempotent.
        #
        # - Only removes contacts that exist in the audience
        # - Contacts not in the audience are ignored
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Audiences::Contacts::Types::RemoveContactsParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::AudienceCountOnly]
        def remove(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[id contacts]
          body_bag = params.slice(*body_prop_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "audiences/contacts",
            body: Pinnacle::Audiences::Contacts::Types::RemoveContactsParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::AudienceCountOnly.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Add contacts to an existing audience. This operation is additive and idempotent.
        #
        # - Phone numbers that don't exist will be auto-created as contacts
        # - Duplicate adds are ignored
        # - Contacts already in the audience are ignored
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Audiences::Contacts::Types::AddContactsParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::AudienceCountOnly]
        def add(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[id contacts]
          body_bag = params.slice(*body_prop_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "audiences/contacts",
            body: Pinnacle::Audiences::Contacts::Types::AddContactsParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::AudienceCountOnly.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
