# frozen_string_literal: true

module Pinnacle
  module Brands
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Automatically populate brand information based on partial input data you provide.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Brands::Types::AutofillBrandParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::OptionalBrandInfo]
      def autofill(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[additional_info name options website]
        body_bag = params.slice(*body_prop_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "brands/autofill",
          body: Pinnacle::Brands::Types::AutofillBrandParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::OptionalBrandInfo.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create a new brand or update an existing one.
      #
      # <Note>
      # **To create a new brand:** Omit `id` — one will be generated automatically.
      #
      # All fields are **required** except `description` and `dba`, and will be validated when
      # [submitted](/api-reference/brands/submit).
      # </Note>
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Brands::Types::UpsertBrandParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::ExtendedBrand]
      def upsert(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[address contact dba description ein email id name sector type entity_type website]
        body_bag = params.slice(*body_prop_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "brands",
          body: Pinnacle::Brands::Types::UpsertBrandParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::ExtendedBrand.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve detailed information for a specific brand in your account by ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Boolean, nil] :hide_ein
      #
      # @return [Pinnacle::Types::ExtendedBrandWithVetting]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[hide_ein]
        query_params = {}
        query_params["hideEIN"] = params[:hide_ein] if params.key?(:hide_ein)
        params = params.except(*query_param_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "brands/#{params[:id]}",
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
          Pinnacle::Types::ExtendedBrandWithVetting.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Submit your brand for review and approval by the compliance team.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :brand_id
      #
      # @return [Pinnacle::Types::SubmissionResults]
      def submit(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "brands/#{params[:brand_id]}/submit",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::SubmissionResults.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Validate your brand information for compliance and correctness before submission or storage.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Types::OptionalBrandInfo]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::ValidationResults]
      def validate(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "brands/validate",
          body: Pinnacle::Types::OptionalBrandInfo.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::ValidationResults.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Submit a brand for external vetting verification to enhance your brand's trust score and improved message
      # delivery rates.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Brands::Types::VetBrandParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :brand_id
      #
      # @return [Pinnacle::Types::VettingResults]
      def vet(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[brand_id]
        body_params = params.except(*path_param_names)
        body_prop_names = %i[type provider vetting_class]
        body_bag = body_params.slice(*body_prop_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "brands/#{params[:brand_id]}/vet",
          body: Pinnacle::Brands::Types::VetBrandParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::VettingResults.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
