# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/autofill_brand_schema_options"
require_relative "../types/optional_brand_info"
require_relative "../types/nullable_contact"
require_relative "../types/company_sector_enum"
require_relative "../types/company_type_enum"
require_relative "../types/extended_brand"
require_relative "../types/extended_brand_with_vetting"
require_relative "../types/submission_results"
require_relative "types/brand_contact"
require_relative "../types/validation_results"
require_relative "../types/vetting_results"
require "async"

module Pinnacle
  class BrandsClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::BrandsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Automatically populate brand information based on partial input data you
    #  provide.
    #
    # @param additional_info [String] Any extra details about the brand to help improve data accuracy.
    # @param name [String] Name of the brand.
    # @param options [Hash] Request of type Pinnacle::Brands::Types::AutofillBrandSchemaOptions, as a Hash
    #   * :force_reload (Boolean)
    # @param website [String] Brand's website URL.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::OptionalBrandInfo]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.autofill(
    #    additional_info: "A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.",
    #    name: "Pinnacle",
    #    options: { force_reload: true },
    #    website: "https://www.pinnacle.sh"
    #  )
    def autofill(additional_info: nil, name: nil, options: nil, website: nil, request_options: nil)
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
          additional_info: additional_info,
          name: name,
          options: options,
          website: website
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/brands/autofill"
      end
      Pinnacle::Types::OptionalBrandInfo.from_json(json_object: response.body)
    end

    # Create a new brand or update an existing brand by with the provided information.
    #
    # @param address [String] Primary brand address where the company is located.
    # @param contact [Hash] Contact information for the brand.Request of type Pinnacle::Types::NullableContact, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :phone (String)
    #   * :title (String)
    # @param dba [String] "Doing Business As" name - the public name the brand operates under.
    # @param description [String] Brief description of what the brand does.
    # @param ein [String] Brand's Employer Identification Number (EIN) assigned by the IRS.
    # @param email [String] Main contact email address for the brand.
    # @param id [Integer] Brand ID - include only when updating an existing brand, omit to create a new
    #  one.
    # @param name [String] Legal name of the brand as registered.
    # @param sector [Pinnacle::Types::CompanySectorEnum] Industry the brand operates in.
    # @param type [Pinnacle::Types::CompanyTypeEnum] Legal structure of the brand.
    # @param website [String] Brand website URL.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ExtendedBrand]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.upsert(
    #    address: "500 Folsom St, San Francisco, CA 94105",
    #    contact: { email: "michael.chen@trypinnacle.app", name: "Michael Chen", phone: "+14155551234", title: "Customer Support Representative" },
    #    dba: "Pinnacle RCS",
    #    description: "A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.",
    #    ein: "88-1234567",
    #    email: "founders@trypinnacle.app",
    #    id: 1,
    #    name: "Pinnacle",
    #    sector: TECHNOLOGY,
    #    type: PRIVATE_PROFIT,
    #    website: "https://www.pinnacle.sh"
    #  )
    def upsert(address: nil, contact: nil, dba: nil, description: nil, ein: nil, email: nil, id: nil, name: nil,
               sector: nil, type: nil, website: nil, request_options: nil)
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
          address: address,
          contact: contact,
          dba: dba,
          description: description,
          ein: ein,
          email: email,
          id: id,
          name: name,
          sector: sector,
          type: type,
          website: website
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/brands"
      end
      Pinnacle::Types::ExtendedBrand.from_json(json_object: response.body)
    end

    # Retrieve detailed information for a specific brand in your account by ID.
    #
    # @param id [Integer] ID of an existing brand in your account that you want to retrieve.
    # @param hide_ein [Boolean] Optional flag to mask the Employer Identification Number in the response for
    #  security purposes.<br>
    #  When you set this to true, the EIN value will be replaced with a masked
    #  placeholder instead of the actual number.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ExtendedBrandWithVetting]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.get(id: 1)
    def get(id:, hide_ein: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "hideEIN": hide_ein }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/brands/#{id}"
      end
      Pinnacle::Types::ExtendedBrandWithVetting.from_json(json_object: response.body)
    end

    # Submit your brand for review and approval by the compliance team.
    #
    # @param brand_id [Integer] The unique identifier of the brand you want to submit for review. <br>
    #  Must correspond to an existing brand in your account that is ready for
    #  submission.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::SubmissionResults]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.submit(brand_id: 1)
    def submit(brand_id:, request_options: nil)
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/brands/#{brand_id}/submit"
      end
      Pinnacle::Types::SubmissionResults.from_json(json_object: response.body)
    end

    # Validate your brand information for compliance and correctness before submission
    #  or storage.
    #
    # @param address [String] Primary brand address where the brand is located.
    # @param contact [Hash] Contact information for the primary brand representative.Request of type Pinnacle::Brands::Types::BrandContact, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :phone (String)
    #   * :title (String)
    # @param dba [String] "Doing Business As" name - the public name the brand operates under.
    # @param description [String] Brief description of what the brand does.
    # @param ein [String] Employer Identification Number (EIN) assigned by the IRS.
    # @param email [String] Main contact email address for the brand.
    # @param name [String] Legal name of the brand as registered.
    # @param sector [Pinnacle::Types::CompanySectorEnum]
    # @param type [Pinnacle::Types::CompanyTypeEnum]
    # @param website [String] Brand website URL.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ValidationResults]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.validate(
    #    address: "500 Folsom St, San Francisco, CA 94105",
    #    contact: { email: "michael.chen@trypinnacle.app", name: "Michael Chen", phone: "+14155551234", title: "Customer Support Representative" },
    #    dba: "Pinnacle Messaging",
    #    description: "Pinnacle is an SMS, MMS, and RCS API for scaling conversations with customers you value.",
    #    ein: "88-1234567",
    #    email: "founders@trypinnacle.app",
    #    name: "Pinnacle",
    #    sector: TECHNOLOGY,
    #    type: PRIVATE_PROFIT,
    #    website: "https://www.pinnacle.sh"
    #  )
    def validate(address:, contact:, description:, email:, name:, sector:, type:, website:, dba: nil, ein: nil,
                 request_options: nil)
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
          address: address,
          contact: contact,
          dba: dba,
          description: description,
          ein: ein,
          email: email,
          name: name,
          sector: sector,
          type: type,
          website: website
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/brands/validate"
      end
      Pinnacle::Types::ValidationResults.from_json(json_object: response.body)
    end

    # Submit a brand for external vetting verification to enhance your brand's trust
    #  score and improved message delivery rates.
    #
    # @param brand_id [Integer] The unique identifier of the brand to vet. <br>
    #  The brand must be already registered before it can be vetted.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::VettingResults]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.vet(brand_id: 1)
    def vet(brand_id:, request_options: nil)
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
          "type": "EXTERNAL",
          "provider": "AEGIS",
          "vettingClass": "STANDARD"
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/brands/#{brand_id}/vet"
      end
      Pinnacle::Types::VettingResults.from_json(json_object: response.body)
    end
  end

  class AsyncBrandsClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncBrandsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Automatically populate brand information based on partial input data you
    #  provide.
    #
    # @param additional_info [String] Any extra details about the brand to help improve data accuracy.
    # @param name [String] Name of the brand.
    # @param options [Hash] Request of type Pinnacle::Brands::Types::AutofillBrandSchemaOptions, as a Hash
    #   * :force_reload (Boolean)
    # @param website [String] Brand's website URL.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::OptionalBrandInfo]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.autofill(
    #    additional_info: "A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.",
    #    name: "Pinnacle",
    #    options: { force_reload: true },
    #    website: "https://www.pinnacle.sh"
    #  )
    def autofill(additional_info: nil, name: nil, options: nil, website: nil, request_options: nil)
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
            additional_info: additional_info,
            name: name,
            options: options,
            website: website
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/brands/autofill"
        end
        Pinnacle::Types::OptionalBrandInfo.from_json(json_object: response.body)
      end
    end

    # Create a new brand or update an existing brand by with the provided information.
    #
    # @param address [String] Primary brand address where the company is located.
    # @param contact [Hash] Contact information for the brand.Request of type Pinnacle::Types::NullableContact, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :phone (String)
    #   * :title (String)
    # @param dba [String] "Doing Business As" name - the public name the brand operates under.
    # @param description [String] Brief description of what the brand does.
    # @param ein [String] Brand's Employer Identification Number (EIN) assigned by the IRS.
    # @param email [String] Main contact email address for the brand.
    # @param id [Integer] Brand ID - include only when updating an existing brand, omit to create a new
    #  one.
    # @param name [String] Legal name of the brand as registered.
    # @param sector [Pinnacle::Types::CompanySectorEnum] Industry the brand operates in.
    # @param type [Pinnacle::Types::CompanyTypeEnum] Legal structure of the brand.
    # @param website [String] Brand website URL.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ExtendedBrand]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.upsert(
    #    address: "500 Folsom St, San Francisco, CA 94105",
    #    contact: { email: "michael.chen@trypinnacle.app", name: "Michael Chen", phone: "+14155551234", title: "Customer Support Representative" },
    #    dba: "Pinnacle RCS",
    #    description: "A developer-friendly, compliant API for SMS, MMS, and RCS, built to scale real conversations.",
    #    ein: "88-1234567",
    #    email: "founders@trypinnacle.app",
    #    id: 1,
    #    name: "Pinnacle",
    #    sector: TECHNOLOGY,
    #    type: PRIVATE_PROFIT,
    #    website: "https://www.pinnacle.sh"
    #  )
    def upsert(address: nil, contact: nil, dba: nil, description: nil, ein: nil, email: nil, id: nil, name: nil,
               sector: nil, type: nil, website: nil, request_options: nil)
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
            address: address,
            contact: contact,
            dba: dba,
            description: description,
            ein: ein,
            email: email,
            id: id,
            name: name,
            sector: sector,
            type: type,
            website: website
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/brands"
        end
        Pinnacle::Types::ExtendedBrand.from_json(json_object: response.body)
      end
    end

    # Retrieve detailed information for a specific brand in your account by ID.
    #
    # @param id [Integer] ID of an existing brand in your account that you want to retrieve.
    # @param hide_ein [Boolean] Optional flag to mask the Employer Identification Number in the response for
    #  security purposes.<br>
    #  When you set this to true, the EIN value will be replaced with a masked
    #  placeholder instead of the actual number.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ExtendedBrandWithVetting]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.get(id: 1)
    def get(id:, hide_ein: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "hideEIN": hide_ein }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/brands/#{id}"
        end
        Pinnacle::Types::ExtendedBrandWithVetting.from_json(json_object: response.body)
      end
    end

    # Submit your brand for review and approval by the compliance team.
    #
    # @param brand_id [Integer] The unique identifier of the brand you want to submit for review. <br>
    #  Must correspond to an existing brand in your account that is ready for
    #  submission.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::SubmissionResults]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.submit(brand_id: 1)
    def submit(brand_id:, request_options: nil)
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/brands/#{brand_id}/submit"
        end
        Pinnacle::Types::SubmissionResults.from_json(json_object: response.body)
      end
    end

    # Validate your brand information for compliance and correctness before submission
    #  or storage.
    #
    # @param address [String] Primary brand address where the brand is located.
    # @param contact [Hash] Contact information for the primary brand representative.Request of type Pinnacle::Brands::Types::BrandContact, as a Hash
    #   * :email (String)
    #   * :name (String)
    #   * :phone (String)
    #   * :title (String)
    # @param dba [String] "Doing Business As" name - the public name the brand operates under.
    # @param description [String] Brief description of what the brand does.
    # @param ein [String] Employer Identification Number (EIN) assigned by the IRS.
    # @param email [String] Main contact email address for the brand.
    # @param name [String] Legal name of the brand as registered.
    # @param sector [Pinnacle::Types::CompanySectorEnum]
    # @param type [Pinnacle::Types::CompanyTypeEnum]
    # @param website [String] Brand website URL.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ValidationResults]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.validate(
    #    address: "500 Folsom St, San Francisco, CA 94105",
    #    contact: { email: "michael.chen@trypinnacle.app", name: "Michael Chen", phone: "+14155551234", title: "Customer Support Representative" },
    #    dba: "Pinnacle Messaging",
    #    description: "Pinnacle is an SMS, MMS, and RCS API for scaling conversations with customers you value.",
    #    ein: "88-1234567",
    #    email: "founders@trypinnacle.app",
    #    name: "Pinnacle",
    #    sector: TECHNOLOGY,
    #    type: PRIVATE_PROFIT,
    #    website: "https://www.pinnacle.sh"
    #  )
    def validate(address:, contact:, description:, email:, name:, sector:, type:, website:, dba: nil, ein: nil,
                 request_options: nil)
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
            address: address,
            contact: contact,
            dba: dba,
            description: description,
            ein: ein,
            email: email,
            name: name,
            sector: sector,
            type: type,
            website: website
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/brands/validate"
        end
        Pinnacle::Types::ValidationResults.from_json(json_object: response.body)
      end
    end

    # Submit a brand for external vetting verification to enhance your brand's trust
    #  score and improved message delivery rates.
    #
    # @param brand_id [Integer] The unique identifier of the brand to vet. <br>
    #  The brand must be already registered before it can be vetted.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::VettingResults]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.brands.vet(brand_id: 1)
    def vet(brand_id:, request_options: nil)
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
            "type": "EXTERNAL",
            "provider": "AEGIS",
            "vettingClass": "STANDARD"
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/brands/#{brand_id}/vet"
        end
        Pinnacle::Types::VettingResults.from_json(json_object: response.body)
      end
    end
  end
end
