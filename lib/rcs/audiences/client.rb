# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/audiences_get_response"
require_relative "../types/audience_count_only"
require_relative "../types/delete_audience_response"
require "async"

module Pinnacle
  class AudiencesClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::AudiencesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve an audience by ID with optional pagination.
    #
    # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
    #  `aud_`, for example: `aud_abc123`.
    # @param page [Integer] Page number. If provided with or without limit, returns paginated contacts.
    # @param limit [Integer] Items per page. If provided with or without page, returns paginated contacts.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::AudienceWithPagination, Pinnacle::Types::AudienceCountOnly]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.get(id: "aud_abc123")
    def get(id:, page: nil, limit: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "id": id,
          "page": page,
          "limit": limit
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
      end
      Pinnacle::Audiences::Types::AudiencesGetResponse.from_json(json_object: response.body)
    end

    # Create a new audience with optional initial contacts. Phone numbers that don't
    #  exist will be auto-created as contacts.
    #
    # @param name [String] Audience name.
    # @param description [String] Audience description.
    # @param contacts [Array<String>] Optional array of phone numbers (E.164 format) or contact IDs.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::AudienceCountOnly]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.create(name: "Marketing Campaign Q1", description: "Contacts for Q1 marketing push")
    def create(name:, description: nil, contacts: nil, request_options: nil)
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
          name: name,
          description: description,
          contacts: contacts
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
      end
      Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
    end

    # Permanently delete an audience and all its contact associations.
    #  Note: This will NOT delete the contacts themselves, only the audience and its
    #  memberships.
    #
    # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
    #  `aud_`, for example: `aud_abc123`.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::DeleteAudienceResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.delete(id: "aud_abc123")
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
      end
      Pinnacle::Types::DeleteAudienceResponse.from_json(json_object: response.body)
    end

    # Update audience metadata. This endpoint does NOT modify contacts.
    #  To add or remove contacts, use the [Add
    #  Contacts](/api-reference/audiences/add-contacts) or [Remove
    #  Contacts](/api-reference/audiences/remove-contacts) endpoints.
    #
    # @param id [String] Audience ID to update. This identifier is a string that always begins with the
    #  prefix `aud_`, for example: `aud_abc123`.
    # @param name [String] New audience name.
    # @param description [String] New audience description.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::AudienceCountOnly]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.update(
    #    id: "aud_abc123",
    #    name: "Updated Audience Name",
    #    description: "New description"
    #  )
    def update(id:, name: nil, description: nil, request_options: nil)
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
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          id: id,
          name: name,
          description: description
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
      end
      Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
    end
  end

  class AsyncAudiencesClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncAudiencesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve an audience by ID with optional pagination.
    #
    # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
    #  `aud_`, for example: `aud_abc123`.
    # @param page [Integer] Page number. If provided with or without limit, returns paginated contacts.
    # @param limit [Integer] Items per page. If provided with or without page, returns paginated contacts.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::AudienceWithPagination, Pinnacle::Types::AudienceCountOnly]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.get(id: "aud_abc123")
    def get(id:, page: nil, limit: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "id": id,
            "page": page,
            "limit": limit
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
        end
        Pinnacle::Audiences::Types::AudiencesGetResponse.from_json(json_object: response.body)
      end
    end

    # Create a new audience with optional initial contacts. Phone numbers that don't
    #  exist will be auto-created as contacts.
    #
    # @param name [String] Audience name.
    # @param description [String] Audience description.
    # @param contacts [Array<String>] Optional array of phone numbers (E.164 format) or contact IDs.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::AudienceCountOnly]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.create(name: "Marketing Campaign Q1", description: "Contacts for Q1 marketing push")
    def create(name:, description: nil, contacts: nil, request_options: nil)
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
            name: name,
            description: description,
            contacts: contacts
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
        end
        Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
      end
    end

    # Permanently delete an audience and all its contact associations.
    #  Note: This will NOT delete the contacts themselves, only the audience and its
    #  memberships.
    #
    # @param id [String] Audience ID. This identifier is a string that always begins with the prefix
    #  `aud_`, for example: `aud_abc123`.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::DeleteAudienceResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.delete(id: "aud_abc123")
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
        end
        Pinnacle::Types::DeleteAudienceResponse.from_json(json_object: response.body)
      end
    end

    # Update audience metadata. This endpoint does NOT modify contacts.
    #  To add or remove contacts, use the [Add
    #  Contacts](/api-reference/audiences/add-contacts) or [Remove
    #  Contacts](/api-reference/audiences/remove-contacts) endpoints.
    #
    # @param id [String] Audience ID to update. This identifier is a string that always begins with the
    #  prefix `aud_`, for example: `aud_abc123`.
    # @param name [String] New audience name.
    # @param description [String] New audience description.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::AudienceCountOnly]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.audiences.update(
    #    id: "aud_abc123",
    #    name: "Updated Audience Name",
    #    description: "New description"
    #  )
    def update(id:, name: nil, description: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            id: id,
            name: name,
            description: description
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/audiences"
        end
        Pinnacle::Types::AudienceCountOnly.from_json(json_object: response.body)
      end
    end
  end
end
