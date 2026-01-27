# frozen_string_literal: true

module Rcs
  module Contacts
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve contact information for a given number.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :id
      # @option params [String, nil] :phone_number
      #
      # @return [Rcs::Types::Contact]
      def get(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id phone_number]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
        query_params["phoneNumber"] = params[:phone_number] if params.key?(:phone_number)
        params.except(*query_param_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "contacts",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::Contact.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create a new contact for a given phone number.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Contacts::Types::CreateContactParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::Types::ContactId]
      def create(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[phone_number description email name tags]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "contacts",
          body: Rcs::Contacts::Types::CreateContactParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::ContactId.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update an existing contact.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Contacts::Types::UpdateContactParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::Types::UpdatedContactId]
      def update(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[id description email name tags]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "contacts",
          body: Rcs::Contacts::Types::UpdateContactParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::UpdatedContactId.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
