# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/get_v_card_schema_options"
require_relative "../../types/v_card_data"
require_relative "../../types/v_card_name"
require_relative "../../types/vcard_address"
require_relative "../../types/vcard_phone"
require_relative "../../types/vcard_email"
require_relative "../../types/v_card_geo"
require_relative "../../types/v_card_organization"
require_relative "../../types/vcard_resource"
require "async"

module Pinnacle
  module Tools
    class ContactCardClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Tools::ContactCardClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Retrieve contact information as a vCard and get a presigned URL to download the
      #  file.
      #
      # @param id [Integer] ID of your contact.
      # @param options [Hash] Request of type Pinnacle::Tools::ContactCard::Types::GetVCardSchemaOptions, as a Hash
      #   * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::VCardData]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.contact_card.get(id: 33)
      def get(id:, options: nil, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), id: id, options: options }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/contact-card"
        end
        Pinnacle::Types::VCardData.from_json(json_object: response.body)
      end

      # Create a new contact card or updates an existing one with full vCard data.
      #
      # @param id [Integer] Unique identifier for the contact.
      # @param formatted_name [String] Full display name for the vCard.
      # @param name [Hash] Structured name components.Request of type Pinnacle::Types::VCardName, as a Hash
      #   * :family_name (String)
      #   * :given_name (String)
      #   * :additional_names (Array<String>)
      #   * :honorific_prefixes (Array<String>)
      #   * :honorific_suffixes (Array<String>)
      # @param nickname [Array<String>] Nicknames or aliases.
      # @param birthday [String] Birthday in ISO 8601 date format (YYYY-MM-DD).
      # @param addresses [Array<Hash>] Physical addresses.Request of type Array<Pinnacle::Types::VcardAddress>, as a Hash
      #   * :country_name (String)
      #   * :extended_address (String)
      #   * :fulladdress (String)
      #   * :locality (String)
      #   * :postal_code (String)
      #   * :post_office_box (String)
      #   * :region (String)
      #   * :street_address (String)
      #   * :type (Array<Pinnacle::Types::VCardAddressSchemaTypeItem>)
      # @param url [String] Website URL.
      # @param phones [Array<Hash>] Phone numbers.Request of type Array<Pinnacle::Types::VcardPhone>, as a Hash
      #   * :type (Array<Pinnacle::Types::VCardPhoneSchemaTypeItem>)
      #   * :value (String)
      # @param emails [Array<Hash>] Email addresses.Request of type Array<Pinnacle::Types::VcardEmail>, as a Hash
      #   * :type (Array<Pinnacle::Types::VCardEmailSchemaTypeItem>)
      #   * :value (String)
      # @param timezone [String] Timezone (e.g., "America/New_York").
      # @param geo [Hash] Geographic coordinates.Request of type Pinnacle::Types::VCardGeo, as a Hash
      #   * :latitude (Float)
      #   * :longitude (Float)
      # @param title [String] Job title or position.
      # @param role [String] Role or function within the organization.
      # @param organization [Hash] Organization or company information.Request of type Pinnacle::Types::VCardOrganization, as a Hash
      #   * :name (String)
      #   * :units (Array<String>)
      # @param categories [Array<String>] Categories or tags for organizing contacts.
      # @param note [String] Additional notes or comments.
      # @param photo [String] Contact's photo
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::VcardResource]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.contact_card.upsert(photo: "https://fastly.picsum.photos/id/853/200/200.jpg?hmac=f4LF-tVBBnJb9PQAVEO8GCTGWgLUnxQLw44rUofE6mQ")
      def upsert(id: nil, formatted_name: nil, name: nil, nickname: nil, birthday: nil, addresses: nil, url: nil,
                 phones: nil, emails: nil, timezone: nil, geo: nil, title: nil, role: nil, organization: nil, categories: nil, note: nil, photo: nil, request_options: nil)
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
            id: id,
            formattedName: formatted_name,
            name: name,
            nickname: nickname,
            birthday: birthday,
            addresses: addresses,
            url: url,
            phones: phones,
            emails: emails,
            timezone: timezone,
            geo: geo,
            title: title,
            role: role,
            organization: organization,
            categories: categories,
            note: note,
            photo: photo
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/contact-card/upsert"
        end
        Pinnacle::Types::VcardResource.from_json(json_object: response.body)
      end
    end

    class AsyncContactCardClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Tools::AsyncContactCardClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Retrieve contact information as a vCard and get a presigned URL to download the
      #  file.
      #
      # @param id [Integer] ID of your contact.
      # @param options [Hash] Request of type Pinnacle::Tools::ContactCard::Types::GetVCardSchemaOptions, as a Hash
      #   * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::VCardData]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.contact_card.get(id: 33)
      def get(id:, options: nil, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), id: id, options: options }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/contact-card"
          end
          Pinnacle::Types::VCardData.from_json(json_object: response.body)
        end
      end

      # Create a new contact card or updates an existing one with full vCard data.
      #
      # @param id [Integer] Unique identifier for the contact.
      # @param formatted_name [String] Full display name for the vCard.
      # @param name [Hash] Structured name components.Request of type Pinnacle::Types::VCardName, as a Hash
      #   * :family_name (String)
      #   * :given_name (String)
      #   * :additional_names (Array<String>)
      #   * :honorific_prefixes (Array<String>)
      #   * :honorific_suffixes (Array<String>)
      # @param nickname [Array<String>] Nicknames or aliases.
      # @param birthday [String] Birthday in ISO 8601 date format (YYYY-MM-DD).
      # @param addresses [Array<Hash>] Physical addresses.Request of type Array<Pinnacle::Types::VcardAddress>, as a Hash
      #   * :country_name (String)
      #   * :extended_address (String)
      #   * :fulladdress (String)
      #   * :locality (String)
      #   * :postal_code (String)
      #   * :post_office_box (String)
      #   * :region (String)
      #   * :street_address (String)
      #   * :type (Array<Pinnacle::Types::VCardAddressSchemaTypeItem>)
      # @param url [String] Website URL.
      # @param phones [Array<Hash>] Phone numbers.Request of type Array<Pinnacle::Types::VcardPhone>, as a Hash
      #   * :type (Array<Pinnacle::Types::VCardPhoneSchemaTypeItem>)
      #   * :value (String)
      # @param emails [Array<Hash>] Email addresses.Request of type Array<Pinnacle::Types::VcardEmail>, as a Hash
      #   * :type (Array<Pinnacle::Types::VCardEmailSchemaTypeItem>)
      #   * :value (String)
      # @param timezone [String] Timezone (e.g., "America/New_York").
      # @param geo [Hash] Geographic coordinates.Request of type Pinnacle::Types::VCardGeo, as a Hash
      #   * :latitude (Float)
      #   * :longitude (Float)
      # @param title [String] Job title or position.
      # @param role [String] Role or function within the organization.
      # @param organization [Hash] Organization or company information.Request of type Pinnacle::Types::VCardOrganization, as a Hash
      #   * :name (String)
      #   * :units (Array<String>)
      # @param categories [Array<String>] Categories or tags for organizing contacts.
      # @param note [String] Additional notes or comments.
      # @param photo [String] Contact's photo
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::VcardResource]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.contact_card.upsert(photo: "https://fastly.picsum.photos/id/853/200/200.jpg?hmac=f4LF-tVBBnJb9PQAVEO8GCTGWgLUnxQLw44rUofE6mQ")
      def upsert(id: nil, formatted_name: nil, name: nil, nickname: nil, birthday: nil, addresses: nil, url: nil,
                 phones: nil, emails: nil, timezone: nil, geo: nil, title: nil, role: nil, organization: nil, categories: nil, note: nil, photo: nil, request_options: nil)
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
              id: id,
              formattedName: formatted_name,
              name: name,
              nickname: nickname,
              birthday: birthday,
              addresses: addresses,
              url: url,
              phones: phones,
              emails: emails,
              timezone: timezone,
              geo: geo,
              title: title,
              role: role,
              organization: organization,
              categories: categories,
              note: note,
              photo: photo
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/contact-card/upsert"
          end
          Pinnacle::Types::VcardResource.from_json(json_object: response.body)
        end
      end
    end
  end
end
