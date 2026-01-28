# frozen_string_literal: true

module Pinnacle
  module Audiences
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve an audience by ID with optional pagination.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :limit
      #
      # @return [Pinnacle::Audiences::Types::AudiencesGetResponse]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id page limit]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        params.except(*query_param_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "audiences",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Audiences::Types::AudiencesGetResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create a new audience with optional initial contacts. Phone numbers that don't exist will be auto-created as
      # contacts.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Audiences::Types::CreateAudienceParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::AudienceCountOnly]
      def create(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "audiences",
          body: Pinnacle::Audiences::Types::CreateAudienceParams.new(params).to_h,
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

      # Permanently delete an audience and all its contact associations.
      #
      # Note: This will NOT delete the contacts themselves, only the audience and its memberships.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Pinnacle::Types::DeleteAudienceResponse]
      def delete(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
        params.except(*query_param_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "audiences",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::DeleteAudienceResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update audience metadata. This endpoint does NOT modify contacts.
      #
      # To add or remove contacts, use the [Add Contacts](/api-reference/audiences/add-contacts) or [Remove
      # Contacts](/api-reference/audiences/remove-contacts) endpoints.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Audiences::Types::UpdateAudienceParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::AudienceCountOnly]
      def update(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "audiences",
          body: Pinnacle::Audiences::Types::UpdateAudienceParams.new(params).to_h,
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

      # @return [Pinnacle::Contacts::Client]
      def contacts
        @contacts ||= Pinnacle::Audiences::Contacts::Client.new(client: @client)
      end
    end
  end
end
