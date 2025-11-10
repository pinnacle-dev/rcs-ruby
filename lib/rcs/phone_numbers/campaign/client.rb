# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/messaging_profile_enum"
require_relative "../../types/attached_phone_number_result"
require_relative "../../types/detached_phone_number_result"
require "async"

module Pinnacle
  module PhoneNumbers
    class CampaignClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::PhoneNumbers::CampaignClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Link a phone number to a specific campaign. Phone numbers must be linked to a
      #  campaign to send messages.
      #
      # @param phones [Array<String>] List of phone number (E.164 format).
      # @param campaign_type [Pinnacle::Types::MessagingProfileEnum]
      # @param campaign_id [String] Unique identifier for the campaign. <br>
      #  - **TOLL_FREE** campaigns:
      #  - Must begin with the prefix `tf_`
      #  - Example: `tf_1234567890`
      #  - **10DLC** campaigns:
      #  - Must begin with the prefix `dlc_`
      #  - Example: `dlc_1234567890`
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::AttachedPhoneNumberResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.campaign.attach(
      #    phones: ["+14155550123", "+14155559876", "+14155550111"],
      #    campaign_type: TOLL_FREE,
      #    campaign_id: "tf_1234567890"
      #  )
      def attach(phones:, campaign_type:, campaign_id:, request_options: nil)
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
            phones: phones,
            campaignType: campaign_type,
            campaignId: campaign_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/attach-campaign"
        end
        Pinnacle::Types::AttachedPhoneNumberResult.from_json(json_object: response.body)
      end

      # Remove the association between a phone number and its attached campaign.
      #
      # @param phones [Array<String>] List of phone numbers (E.164 format).
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::DetachedPhoneNumberResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.campaign.detach(phones: ["+14155559876", "14155550111"])
      def detach(phones:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), phones: phones }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/detach-campaign"
        end
        Pinnacle::Types::DetachedPhoneNumberResult.from_json(json_object: response.body)
      end
    end

    class AsyncCampaignClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::PhoneNumbers::AsyncCampaignClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Link a phone number to a specific campaign. Phone numbers must be linked to a
      #  campaign to send messages.
      #
      # @param phones [Array<String>] List of phone number (E.164 format).
      # @param campaign_type [Pinnacle::Types::MessagingProfileEnum]
      # @param campaign_id [String] Unique identifier for the campaign. <br>
      #  - **TOLL_FREE** campaigns:
      #  - Must begin with the prefix `tf_`
      #  - Example: `tf_1234567890`
      #  - **10DLC** campaigns:
      #  - Must begin with the prefix `dlc_`
      #  - Example: `dlc_1234567890`
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::AttachedPhoneNumberResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.campaign.attach(
      #    phones: ["+14155550123", "+14155559876", "+14155550111"],
      #    campaign_type: TOLL_FREE,
      #    campaign_id: "tf_1234567890"
      #  )
      def attach(phones:, campaign_type:, campaign_id:, request_options: nil)
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
              phones: phones,
              campaignType: campaign_type,
              campaignId: campaign_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/attach-campaign"
          end
          Pinnacle::Types::AttachedPhoneNumberResult.from_json(json_object: response.body)
        end
      end

      # Remove the association between a phone number and its attached campaign.
      #
      # @param phones [Array<String>] List of phone numbers (E.164 format).
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::DetachedPhoneNumberResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.campaign.detach(phones: ["+14155559876", "14155550111"])
      def detach(phones:, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), phones: phones }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/detach-campaign"
          end
          Pinnacle::Types::DetachedPhoneNumberResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
