# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/company"
require "json"
require_relative "types/company_register_request"
require_relative "types/company_register_response"
require_relative "../types/company_contact"
require_relative "../types/messaging"
require_relative "../types/point_of_contact"
require_relative "../types/optionals"
require_relative "types/company_update_response"
require "async"

module Pinnacle
  class CompanyClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::CompanyClient]
    def initialize(request_client:)
      @request_client = request_client
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
    #  api.company.get
    def get(company_id: nil, company_name: nil, request_options: nil)
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
    # @param request [Pinnacle::Company::CompanyRegisterRequestCompanyId, Pinnacle::Company::CompanyRegisterRequestCompany]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Company::CompanyRegisterResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.company.register(request: { company_id: "companyId" })
    def register(request:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/company/register"
      end
      Pinnacle::Company::CompanyRegisterResponse.from_json(json_object: response.body)
    end

    # Update a company on the Pinnacle platform
    #
    # @param company_id [String] Optional company ID. If provided, updates existing company. If not provided,
    #  creates a new company.
    # @param company [Hash] Request of type Pinnacle::Company, as a Hash
    #   * :id (Integer)
    #   * :created_at (DateTime)
    #   * :name (String)
    #   * :category (Pinnacle::CompanyCategory)
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
    #   * :opt_in (String)
    #   * :opt_out (String)
    #   * :opt_out_keywords (Array<String>)
    #   * :agent_use_case (String)
    #   * :expected_agent_responses (String)
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
    # @param messaging [Hash] Request of type Pinnacle::Messaging, as a Hash
    #   * :opt_in (String)
    #   * :opt_out (String)
    #   * :opt_out_keywords (Array<String>)
    #   * :agent_use_case (String)
    #   * :expected_agent_responses (String)
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
    # @return [Pinnacle::Company::CompanyUpdateResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.company.update
    def update(company_id: nil, company: nil, company_contact: nil, messaging: nil, point_of_contact: nil,
               optionals: nil, request_options: nil)
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
          messaging: messaging,
          pointOfContact: point_of_contact,
          optionals: optionals
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/company/update"
      end
      Pinnacle::Company::CompanyUpdateResponse.from_json(json_object: response.body)
    end
  end

  class AsyncCompanyClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncCompanyClient]
    def initialize(request_client:)
      @request_client = request_client
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
    #  api.company.get
    def get(company_id: nil, company_name: nil, request_options: nil)
      Async do
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
    end

    # Register a company for RCS with the Pinnacle platform
    #
    # @param request [Pinnacle::Company::CompanyRegisterRequestCompanyId, Pinnacle::Company::CompanyRegisterRequestCompany]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Company::CompanyRegisterResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.company.register(request: { company_id: "companyId" })
    def register(request:, request_options: nil)
      Async do
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
          req.url "#{@request_client.get_url(request_options: request_options)}/company/register"
        end
        Pinnacle::Company::CompanyRegisterResponse.from_json(json_object: response.body)
      end
    end

    # Update a company on the Pinnacle platform
    #
    # @param company_id [String] Optional company ID. If provided, updates existing company. If not provided,
    #  creates a new company.
    # @param company [Hash] Request of type Pinnacle::Company, as a Hash
    #   * :id (Integer)
    #   * :created_at (DateTime)
    #   * :name (String)
    #   * :category (Pinnacle::CompanyCategory)
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
    #   * :opt_in (String)
    #   * :opt_out (String)
    #   * :opt_out_keywords (Array<String>)
    #   * :agent_use_case (String)
    #   * :expected_agent_responses (String)
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
    # @param messaging [Hash] Request of type Pinnacle::Messaging, as a Hash
    #   * :opt_in (String)
    #   * :opt_out (String)
    #   * :opt_out_keywords (Array<String>)
    #   * :agent_use_case (String)
    #   * :expected_agent_responses (String)
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
    # @return [Pinnacle::Company::CompanyUpdateResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.company.update
    def update(company_id: nil, company: nil, company_contact: nil, messaging: nil, point_of_contact: nil,
               optionals: nil, request_options: nil)
      Async do
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
            messaging: messaging,
            pointOfContact: point_of_contact,
            optionals: optionals
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/company/update"
        end
        Pinnacle::Company::CompanyUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end
