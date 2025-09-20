# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/brand_status"
require_relative "../../types/toll_free_campaign_status"
require_relative "../../types/dlc_campaign_status"
require_relative "../../types/rcs_campaign_status"
require_relative "../../types/phone_number_status"
require "async"

module Pinnacle
  module Status
    class GetClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Status::GetClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Retrieve a brand's status.
      #
      # @param brand_id [Integer] ID of the brand.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BrandStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.brand(brand_id: 28)
      def brand(brand_id:, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/status/brand/#{brand_id}"
        end
        Pinnacle::Types::BrandStatus.from_json(json_object: response.body)
      end

      # Retrieve a toll-free campaign's status.
      #
      # @param campaign_id [Integer] ID of the toll-free campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::TollFreeCampaignStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.toll_free(campaign_id: 28)
      def toll_free(campaign_id:, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/status/toll-free-campaign/#{campaign_id}"
        end
        Pinnacle::Types::TollFreeCampaignStatus.from_json(json_object: response.body)
      end

      # Retrieve a 10DLC campaign's status.
      #
      # @param campaign_id [Integer] ID of the 10DLC campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::DlcCampaignStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.dlc(campaign_id: 28)
      def dlc(campaign_id:, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/status/dlc-campaign/#{campaign_id}"
        end
        Pinnacle::Types::DlcCampaignStatus.from_json(json_object: response.body)
      end

      # Retrieve a RCS campaign's status.
      #
      # @param campaign_id [Integer] ID of the campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::RcsCampaignStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.rcs(campaign_id: 28)
      def rcs(campaign_id:, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/status/rcs-campaign/#{campaign_id}"
        end
        Pinnacle::Types::RcsCampaignStatus.from_json(json_object: response.body)
      end

      # Retrieve a phone number's order status and campaign attachment status. <br>
      #  Check if a number is active and ready to send messages.
      #
      # @param phone_number [String] Phone number in E164 format that is in review.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::PhoneNumberStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.phone_number(phone_number: "+14151234567")
      def phone_number(phone_number:, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/status/phone-number/#{phone_number}"
        end
        Pinnacle::Types::PhoneNumberStatus.from_json(json_object: response.body)
      end
    end

    class AsyncGetClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Status::AsyncGetClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Retrieve a brand's status.
      #
      # @param brand_id [Integer] ID of the brand.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BrandStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.brand(brand_id: 28)
      def brand(brand_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/status/brand/#{brand_id}"
          end
          Pinnacle::Types::BrandStatus.from_json(json_object: response.body)
        end
      end

      # Retrieve a toll-free campaign's status.
      #
      # @param campaign_id [Integer] ID of the toll-free campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::TollFreeCampaignStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.toll_free(campaign_id: 28)
      def toll_free(campaign_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/status/toll-free-campaign/#{campaign_id}"
          end
          Pinnacle::Types::TollFreeCampaignStatus.from_json(json_object: response.body)
        end
      end

      # Retrieve a 10DLC campaign's status.
      #
      # @param campaign_id [Integer] ID of the 10DLC campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::DlcCampaignStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.dlc(campaign_id: 28)
      def dlc(campaign_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/status/dlc-campaign/#{campaign_id}"
          end
          Pinnacle::Types::DlcCampaignStatus.from_json(json_object: response.body)
        end
      end

      # Retrieve a RCS campaign's status.
      #
      # @param campaign_id [Integer] ID of the campaign.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::RcsCampaignStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.rcs(campaign_id: 28)
      def rcs(campaign_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/status/rcs-campaign/#{campaign_id}"
          end
          Pinnacle::Types::RcsCampaignStatus.from_json(json_object: response.body)
        end
      end

      # Retrieve a phone number's order status and campaign attachment status. <br>
      #  Check if a number is active and ready to send messages.
      #
      # @param phone_number [String] Phone number in E164 format that is in review.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::PhoneNumberStatus]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.status.get.phone_number(phone_number: "+14151234567")
      def phone_number(phone_number:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/status/phone-number/#{phone_number}"
          end
          Pinnacle::Types::PhoneNumberStatus.from_json(json_object: response.body)
        end
      end
    end
  end
end
