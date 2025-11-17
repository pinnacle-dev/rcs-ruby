# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/audience_count_only"
require "async"

module Pinnacle
  module Audiences
    class ContactsClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Audiences::ContactsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Remove contacts from an existing audience. This operation is idempotent.
      #  - Only removes contacts that exist in the audience
      #  - Contacts not in the audience are ignored
      #
      # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
      #  `aud_`, for example: `aud_abc123`.
      # @param contacts [Array<String>] Array of phone numbers (E.164 format) or contact IDs (minimum 1 item).
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::AudienceCountOnly]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.audiences.contacts.remove(id: "aud_abc123", contacts: ["+12125551234", "co_def456"])
      def remove(id:, contacts:, request_options: nil)
        response = @request_client.conn.delete do |req|
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
          req.body = { **(request_options&.additional_body_parameters || {}), id: id, contacts: contacts }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/audiences/contacts"
        end
        Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
      end

      # Add contacts to an existing audience. This operation is additive and idempotent.
      #  - Phone numbers that don't exist will be auto-created as contacts
      #  - Duplicate adds are ignored
      #  - Contacts already in the audience are ignored
      #
      # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
      #  `aud_`, for example: `aud_abc123`.
      # @param contacts [Array<String>] Array of phone numbers (E.164 format) or contact IDs (minimum 1 item).
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::AudienceCountOnly]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.audiences.contacts.add(id: "aud_abc123", contacts: ["+12125551234", "co_def456", "+13105551234"])
      def add(id:, contacts:, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.body = { **(request_options&.additional_body_parameters || {}), id: id, contacts: contacts }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/audiences/contacts"
        end
        Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
      end
    end

    class AsyncContactsClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Audiences::AsyncContactsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Remove contacts from an existing audience. This operation is idempotent.
      #  - Only removes contacts that exist in the audience
      #  - Contacts not in the audience are ignored
      #
      # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
      #  `aud_`, for example: `aud_abc123`.
      # @param contacts [Array<String>] Array of phone numbers (E.164 format) or contact IDs (minimum 1 item).
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::AudienceCountOnly]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.audiences.contacts.remove(id: "aud_abc123", contacts: ["+12125551234", "co_def456"])
      def remove(id:, contacts:, request_options: nil)
        Async do
          response = @request_client.conn.delete do |req|
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
            req.body = { **(request_options&.additional_body_parameters || {}), id: id, contacts: contacts }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/audiences/contacts"
          end
          Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
        end
      end

      # Add contacts to an existing audience. This operation is additive and idempotent.
      #  - Phone numbers that don't exist will be auto-created as contacts
      #  - Duplicate adds are ignored
      #  - Contacts already in the audience are ignored
      #
      # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
      #  `aud_`, for example: `aud_abc123`.
      # @param contacts [Array<String>] Array of phone numbers (E.164 format) or contact IDs (minimum 1 item).
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::AudienceCountOnly]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.audiences.contacts.add(id: "aud_abc123", contacts: ["+12125551234", "co_def456", "+13105551234"])
      def add(id:, contacts:, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.body = { **(request_options&.additional_body_parameters || {}), id: id, contacts: contacts }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/audiences/contacts"
          end
          Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
        end
      end
    end
  end
end
