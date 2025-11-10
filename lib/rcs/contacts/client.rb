# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/contact"
require_relative "../types/contact_id"
require_relative "../types/updated_contact_id"
require "async"

module Pinnacle
  class ContactsClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::ContactsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve contact information for a given number.
    #
    # @param id [String] Unique identifier of a specific contact you want to retrieve. <br>
    #  Either this parameter or `phoneNumber` must be provided, but not both.
    # @param phone_number [String] Phone number you want to look up contact information for, provided in
    #  URL-encoded E.164 format with %2B prefix instead of +.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::Contact]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.contacts.get(id: "co_1234567890")
    def get(id: nil, phone_number: nil, request_options: nil)
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
          "phoneNumber": phone_number
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
      end
      Pinnacle::Types::Contact.from_json(json_object: response.body)
    end

    # Create a new contact for a given phone number.
    #
    # @param description [String] New notes or details for your contact.
    # @param email [String] New email address for your contact.
    # @param name [String] New name for your contact.
    # @param tags [Array<String>] New tags for your contact.
    # @param phone_number [String] Phone number to save for your contact, in E.164 format.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ContactId]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.contacts.create(phone_number: "phoneNumber")
    def create(phone_number:, description: nil, email: nil, name: nil, tags: nil, request_options: nil)
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
          description: description,
          email: email,
          name: name,
          tags: tags,
          phoneNumber: phone_number
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
      end
      Pinnacle::Types::ContactId.from_json(json_object: response.body)
    end

    # Update an existing contact.
    #
    # @param description [String] New notes or details for your contact.
    # @param email [String] New email address for your contact.
    # @param name [String] New name for your contact.
    # @param tags [Array<String>] New tags for your contact.
    # @param id [String] ID of the contact you want to update. This identifier is a string that always
    #  begins with the prefix `co_`, for example: `co_1234567890`.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::UpdatedContactId]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.contacts.update(id: "co_1234567890")
    def update(id:, description: nil, email: nil, name: nil, tags: nil, request_options: nil)
      response = @request_client.conn.put do |req|
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
          description: description,
          email: email,
          name: name,
          tags: tags,
          id: id
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
      end
      Pinnacle::Types::UpdatedContactId.from_json(json_object: response.body)
    end
  end

  class AsyncContactsClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncContactsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve contact information for a given number.
    #
    # @param id [String] Unique identifier of a specific contact you want to retrieve. <br>
    #  Either this parameter or `phoneNumber` must be provided, but not both.
    # @param phone_number [String] Phone number you want to look up contact information for, provided in
    #  URL-encoded E.164 format with %2B prefix instead of +.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::Contact]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.contacts.get(id: "co_1234567890")
    def get(id: nil, phone_number: nil, request_options: nil)
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
            "phoneNumber": phone_number
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
        end
        Pinnacle::Types::Contact.from_json(json_object: response.body)
      end
    end

    # Create a new contact for a given phone number.
    #
    # @param description [String] New notes or details for your contact.
    # @param email [String] New email address for your contact.
    # @param name [String] New name for your contact.
    # @param tags [Array<String>] New tags for your contact.
    # @param phone_number [String] Phone number to save for your contact, in E.164 format.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ContactId]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.contacts.create(phone_number: "phoneNumber")
    def create(phone_number:, description: nil, email: nil, name: nil, tags: nil, request_options: nil)
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
            description: description,
            email: email,
            name: name,
            tags: tags,
            phoneNumber: phone_number
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
        end
        Pinnacle::Types::ContactId.from_json(json_object: response.body)
      end
    end

    # Update an existing contact.
    #
    # @param description [String] New notes or details for your contact.
    # @param email [String] New email address for your contact.
    # @param name [String] New name for your contact.
    # @param tags [Array<String>] New tags for your contact.
    # @param id [String] ID of the contact you want to update. This identifier is a string that always
    #  begins with the prefix `co_`, for example: `co_1234567890`.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::UpdatedContactId]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.contacts.update(id: "co_1234567890")
    def update(id:, description: nil, email: nil, name: nil, tags: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do |req|
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
            description: description,
            email: email,
            name: name,
            tags: tags,
            id: id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/contacts"
        end
        Pinnacle::Types::UpdatedContactId.from_json(json_object: response.body)
      end
    end
  end
end
