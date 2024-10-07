# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "rcs/types/check_rcs_capability_response"
require_relative "rcs/types/update_settings_response"
require_relative "rcs/types/get_account_number_response"
require_relative "rcs/types/send_message_request"
require_relative "rcs/types/send_message_response"
require_relative "rcs/types/company"
require "json"
require_relative "rcs/types/company_details"
require_relative "rcs/types/company_contact"
require_relative "rcs/types/point_of_contact"
require_relative "rcs/types/optionals"
require_relative "rcs/types/register_company_response"
require_relative "rcs/types/update_company_response"

module Pinnacle
  class Client
    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Pinnacle::Client]
    def initialize(api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = Pinnacle::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    # Checks if a phone number is able to receive RCS
    #
    # @param phone_number [String] Phone number (E.164 format: [+][country code][subscriber number including area
    #  code]) to check for RCS capability. Example: +1234567890
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.check_rcs_capability(phone_number: "phone_number")
    def check_rcs_capability(phone_number:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "phone_number": phone_number }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/check_rcs"
      end
      Pinnacle::CheckRcsCapabilityResponse.from_json(json_object: response.body)
    end

    # Initializes settings related to RCS messaging, including webhook registration.
    #
    # @param webhook_url [String] Webhook URL to receive inbound messages
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::UpdateSettingsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.update_settings(webhook_url: "webhook_url")
    def update_settings(webhook_url:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), webhook_url: webhook_url }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/update_settings"
      end
      Pinnacle::UpdateSettingsResponse.from_json(json_object: response.body)
    end

    # Retrieve the phone number associated with the account.
    #
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::GetAccountNumberResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_account_number
    def get_account_number(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/get_account_number"
      end
      Pinnacle::GetAccountNumberResponse.from_json(json_object: response.body)
    end

    # Send a SMS or RCS message to a phone number
    #
    # @param request [Pinnacle::CardRcs, Pinnacle::Sms, Pinnacle::BasicRcs, Pinnacle::MediaRcs, Pinnacle::CarouselRcs]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::SendMessageResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send_message(request: { phone_number: "phone_number", message_type: "card", message: { cards: [{ title: "title" }] } })
    def send_message(request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/send"
      end
      Pinnacle::SendMessageResponse.from_json(json_object: response.body)
    end

    # Retrieve the company's information (i.e. approval status, company name, etc.).
    #  Search by company ID or company name.
    #
    # @param company_id [Integer] The unique identifier for the company
    # @param company_name [String] The name of the company
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Array<Pinnacle::Company>]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_company
    def get_company(company_id: nil, company_name: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "companyId": company_id,
          "companyName": company_name
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/company"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Pinnacle::Company.from_json(json_object: item)
      end
    end

    # Register a company for RCS with the Pinnacle platform
    #
    # @param company [Hash] Request of type Pinnacle::CompanyDetails, as a Hash
    #   * :name (String)
    #   * :address (String)
    #   * :ein (String)
    #   * :description (String)
    #   * :brand_color (String)
    #   * :logo_url (String)
    #   * :hero_url (String)
    # @param company_contact [Hash] Request of type Pinnacle::CompanyContact, as a Hash
    #   * :primary_website_url (String)
    #   * :primary_website_label (String)
    #   * :primary_phone (String)
    #   * :primary_phone_label (String)
    #   * :primary_email (String)
    #   * :primary_email_label (String)
    #   * :privacy_policy_url (String)
    #   * :tos_url (String)
    # @param point_of_contact [Hash] Request of type Pinnacle::PointOfContact, as a Hash
    #   * :poc_name (String)
    #   * :poc_title (String)
    #   * :poc_email (String)
    # @param optionals [Hash] Request of type Pinnacle::Optionals, as a Hash
    #   * :additional_websites (Array<Pinnacle::AdditionalWebsite>)
    #   * :additional_phone_numbers (Array<Pinnacle::AdditionalPhoneNumber>)
    #   * :additional_emails (Array<Pinnacle::AdditionalEmail>)
    #   * :test_numbers (Array<String>)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::RegisterCompanyResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.register_company(
    #    company: { name: "name", address: "address", ein: "ein", description: "description", brand_color: "brandColor", logo_url: "logoUrl", hero_url: "heroUrl" },
    #    company_contact: { primary_website_url: "primaryWebsiteUrl", primary_website_label: "primaryWebsiteLabel", primary_phone: "primaryPhone", primary_phone_label: "primaryPhoneLabel", primary_email: "primaryEmail", primary_email_label: "primaryEmailLabel", privacy_policy_url: "privacyPolicyUrl", tos_url: "tosUrl" },
    #    point_of_contact: { poc_name: "pocName", poc_title: "pocTitle", poc_email: "pocEmail" }
    #  )
    def register_company(company:, company_contact:, point_of_contact:, optionals: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
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
          company: company,
          companyContact: company_contact,
          pointOfContact: point_of_contact,
          optionals: optionals
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/company/register"
      end
      Pinnacle::RegisterCompanyResponse.from_json(json_object: response.body)
    end

    # Update a company on the Pinnacle platform
    #
    # @param company_id [String]
    # @param company [Hash] Request of type Pinnacle::Company, as a Hash
    #   * :id (Integer)
    #   * :created_at (DateTime)
    #   * :name (String)
    #   * :address (String)
    #   * :ein (String)
    #   * :description (String)
    #   * :brand_color (String)
    #   * :logo_url (String)
    #   * :hero_url (String)
    #   * :primary_website_url (String)
    #   * :primary_website_label (String)
    #   * :primary_phone (String)
    #   * :primary_phone_label (String)
    #   * :primary_email (String)
    #   * :primary_email_label (String)
    #   * :privacy_policy_url (String)
    #   * :tos_url (String)
    #   * :poc_name (String)
    #   * :poc_title (String)
    #   * :poc_email (String)
    #   * :test_numbers (Array<String>)
    #   * :status (String)
    #   * :additional_websites (Array<Pinnacle::CompanyAdditionalWebsitesItem>)
    #   * :additional_emails (Array<Pinnacle::CompanyAdditionalEmailsItem>)
    #   * :additional_phone_numbers (Array<Pinnacle::CompanyAdditionalPhoneNumbersItem>)
    # @param company_contact [Hash] Request of type Pinnacle::CompanyContact, as a Hash
    #   * :primary_website_url (String)
    #   * :primary_website_label (String)
    #   * :primary_phone (String)
    #   * :primary_phone_label (String)
    #   * :primary_email (String)
    #   * :primary_email_label (String)
    #   * :privacy_policy_url (String)
    #   * :tos_url (String)
    # @param point_of_contact [Hash] Request of type Pinnacle::PointOfContact, as a Hash
    #   * :poc_name (String)
    #   * :poc_title (String)
    #   * :poc_email (String)
    # @param optionals [Hash] Request of type Pinnacle::Optionals, as a Hash
    #   * :additional_websites (Array<Pinnacle::AdditionalWebsite>)
    #   * :additional_phone_numbers (Array<Pinnacle::AdditionalPhoneNumber>)
    #   * :additional_emails (Array<Pinnacle::AdditionalEmail>)
    #   * :test_numbers (Array<String>)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::UpdateCompanyResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.update_company(company_id: "companyId")
    def update_company(company_id:, company: nil, company_contact: nil, point_of_contact: nil, optionals: nil,
                       request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
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
          companyId: company_id,
          company: company,
          companyContact: company_contact,
          pointOfContact: point_of_contact,
          optionals: optionals
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/company/update"
      end
      Pinnacle::UpdateCompanyResponse.from_json(json_object: response.body)
    end
  end

  class AsyncClient
    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Pinnacle::AsyncClient]
    def initialize(api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = Pinnacle::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    # Checks if a phone number is able to receive RCS
    #
    # @param phone_number [String] Phone number (E.164 format: [+][country code][subscriber number including area
    #  code]) to check for RCS capability. Example: +1234567890
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.check_rcs_capability(phone_number: "phone_number")
    def check_rcs_capability(phone_number:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "phone_number": phone_number }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/check_rcs"
      end
      Pinnacle::CheckRcsCapabilityResponse.from_json(json_object: response.body)
    end

    # Initializes settings related to RCS messaging, including webhook registration.
    #
    # @param webhook_url [String] Webhook URL to receive inbound messages
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::UpdateSettingsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.update_settings(webhook_url: "webhook_url")
    def update_settings(webhook_url:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), webhook_url: webhook_url }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/update_settings"
      end
      Pinnacle::UpdateSettingsResponse.from_json(json_object: response.body)
    end

    # Retrieve the phone number associated with the account.
    #
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::GetAccountNumberResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_account_number
    def get_account_number(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/get_account_number"
      end
      Pinnacle::GetAccountNumberResponse.from_json(json_object: response.body)
    end

    # Send a SMS or RCS message to a phone number
    #
    # @param request [Pinnacle::CardRcs, Pinnacle::Sms, Pinnacle::BasicRcs, Pinnacle::MediaRcs, Pinnacle::CarouselRcs]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::SendMessageResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send_message(request: { phone_number: "phone_number", message_type: "card", message: { cards: [{ title: "title" }] } })
    def send_message(request:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/send"
      end
      Pinnacle::SendMessageResponse.from_json(json_object: response.body)
    end

    # Retrieve the company's information (i.e. approval status, company name, etc.).
    #  Search by company ID or company name.
    #
    # @param company_id [Integer] The unique identifier for the company
    # @param company_name [String] The name of the company
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Array<Pinnacle::Company>]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_company
    def get_company(company_id: nil, company_name: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "companyId": company_id,
          "companyName": company_name
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/company"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Pinnacle::Company.from_json(json_object: item)
      end
    end

    # Register a company for RCS with the Pinnacle platform
    #
    # @param company [Hash] Request of type Pinnacle::CompanyDetails, as a Hash
    #   * :name (String)
    #   * :address (String)
    #   * :ein (String)
    #   * :description (String)
    #   * :brand_color (String)
    #   * :logo_url (String)
    #   * :hero_url (String)
    # @param company_contact [Hash] Request of type Pinnacle::CompanyContact, as a Hash
    #   * :primary_website_url (String)
    #   * :primary_website_label (String)
    #   * :primary_phone (String)
    #   * :primary_phone_label (String)
    #   * :primary_email (String)
    #   * :primary_email_label (String)
    #   * :privacy_policy_url (String)
    #   * :tos_url (String)
    # @param point_of_contact [Hash] Request of type Pinnacle::PointOfContact, as a Hash
    #   * :poc_name (String)
    #   * :poc_title (String)
    #   * :poc_email (String)
    # @param optionals [Hash] Request of type Pinnacle::Optionals, as a Hash
    #   * :additional_websites (Array<Pinnacle::AdditionalWebsite>)
    #   * :additional_phone_numbers (Array<Pinnacle::AdditionalPhoneNumber>)
    #   * :additional_emails (Array<Pinnacle::AdditionalEmail>)
    #   * :test_numbers (Array<String>)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::RegisterCompanyResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.register_company(
    #    company: { name: "name", address: "address", ein: "ein", description: "description", brand_color: "brandColor", logo_url: "logoUrl", hero_url: "heroUrl" },
    #    company_contact: { primary_website_url: "primaryWebsiteUrl", primary_website_label: "primaryWebsiteLabel", primary_phone: "primaryPhone", primary_phone_label: "primaryPhoneLabel", primary_email: "primaryEmail", primary_email_label: "primaryEmailLabel", privacy_policy_url: "privacyPolicyUrl", tos_url: "tosUrl" },
    #    point_of_contact: { poc_name: "pocName", poc_title: "pocTitle", poc_email: "pocEmail" }
    #  )
    def register_company(company:, company_contact:, point_of_contact:, optionals: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          company: company,
          companyContact: company_contact,
          pointOfContact: point_of_contact,
          optionals: optionals
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/company/register"
      end
      Pinnacle::RegisterCompanyResponse.from_json(json_object: response.body)
    end

    # Update a company on the Pinnacle platform
    #
    # @param company_id [String]
    # @param company [Hash] Request of type Pinnacle::Company, as a Hash
    #   * :id (Integer)
    #   * :created_at (DateTime)
    #   * :name (String)
    #   * :address (String)
    #   * :ein (String)
    #   * :description (String)
    #   * :brand_color (String)
    #   * :logo_url (String)
    #   * :hero_url (String)
    #   * :primary_website_url (String)
    #   * :primary_website_label (String)
    #   * :primary_phone (String)
    #   * :primary_phone_label (String)
    #   * :primary_email (String)
    #   * :primary_email_label (String)
    #   * :privacy_policy_url (String)
    #   * :tos_url (String)
    #   * :poc_name (String)
    #   * :poc_title (String)
    #   * :poc_email (String)
    #   * :test_numbers (Array<String>)
    #   * :status (String)
    #   * :additional_websites (Array<Pinnacle::CompanyAdditionalWebsitesItem>)
    #   * :additional_emails (Array<Pinnacle::CompanyAdditionalEmailsItem>)
    #   * :additional_phone_numbers (Array<Pinnacle::CompanyAdditionalPhoneNumbersItem>)
    # @param company_contact [Hash] Request of type Pinnacle::CompanyContact, as a Hash
    #   * :primary_website_url (String)
    #   * :primary_website_label (String)
    #   * :primary_phone (String)
    #   * :primary_phone_label (String)
    #   * :primary_email (String)
    #   * :primary_email_label (String)
    #   * :privacy_policy_url (String)
    #   * :tos_url (String)
    # @param point_of_contact [Hash] Request of type Pinnacle::PointOfContact, as a Hash
    #   * :poc_name (String)
    #   * :poc_title (String)
    #   * :poc_email (String)
    # @param optionals [Hash] Request of type Pinnacle::Optionals, as a Hash
    #   * :additional_websites (Array<Pinnacle::AdditionalWebsite>)
    #   * :additional_phone_numbers (Array<Pinnacle::AdditionalPhoneNumber>)
    #   * :additional_emails (Array<Pinnacle::AdditionalEmail>)
    #   * :test_numbers (Array<String>)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::UpdateCompanyResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.update_company(company_id: "companyId")
    def update_company(company_id:, company: nil, company_contact: nil, point_of_contact: nil, optionals: nil,
                       request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          companyId: company_id,
          company: company,
          companyContact: company_contact,
          pointOfContact: point_of_contact,
          optionals: optionals
        }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/company/update"
      end
      Pinnacle::UpdateCompanyResponse.from_json(json_object: response.body)
    end
  end
end
