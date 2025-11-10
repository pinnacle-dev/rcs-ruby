# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/attach_webhook_params"
require_relative "../../types/configured_webhook"
require_relative "../../types/detached_webhook_info"
require "async"

module Pinnacle
  module PhoneNumbers
    class WebhookClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::PhoneNumbers::WebhookClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Connect a webhook to your phone number to receive real-time notifications for
      #  incoming messages, delivery status updates, and other communication events.
      #
      # @param phone [String] The phone number you want to attach the webhook to in E.164 format. Make sure it
      #  is url encoded (i.e. replace the leading + with %2B). <br>
      #  Must be a phone number that you own and have already [purchased](./buy) through
      #  the API. A phone number can have multiple webhooks attached to it.
      # @param request [Pinnacle::Types::AttachWebhookByIdParams, Pinnacle::Types::CreateAndAttachWebhookByUrlParams]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ConfiguredWebhook]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.webhook.attach(phone: "%2B14155551234", request: { webhook_id: "wh_1234567890", event: MESSAGE_STATUS })
      def attach(phone:, request:, request_options: nil)
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/#{phone}/attach-webhook"
        end
        Pinnacle::Types::ConfiguredWebhook.from_json(json_object: response.body)
      end

      # Disconnect a webhook from your phone number to stop receiving event
      #  notifications for that specific number. <br>
      #  The webhook configuration itself remains intact and available for use with other
      #  phone numbers.
      #
      # @param phone [String] The phone number you want to attach the webhook to in E.164 format. Make sure it
      #  is url encoded (i.e. replace the leading + with %2B). <br>
      #  Must be a phone number that you own and currently has the specified webhook
      #  attached.
      # @param webhook_id [String] The unique identifier of the webhook you want to detach from the phone number.
      #  <br>
      #  This must be a valid webhook ID that is currently attached to the specified
      #  phone number. This identifier is a string that always begins with the prefix
      #  `wh_`, for example: `wh_1234567890`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::DetachedWebhookInfo]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.webhook.detach(phone: "+14155551234", webhook_id: "wh_1234567890")
      def detach(phone:, webhook_id:, request_options: nil)
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/#{phone}/detach-webhook/#{webhook_id}"
        end
        Pinnacle::Types::DetachedWebhookInfo.from_json(json_object: response.body)
      end
    end

    class AsyncWebhookClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::PhoneNumbers::AsyncWebhookClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Connect a webhook to your phone number to receive real-time notifications for
      #  incoming messages, delivery status updates, and other communication events.
      #
      # @param phone [String] The phone number you want to attach the webhook to in E.164 format. Make sure it
      #  is url encoded (i.e. replace the leading + with %2B). <br>
      #  Must be a phone number that you own and have already [purchased](./buy) through
      #  the API. A phone number can have multiple webhooks attached to it.
      # @param request [Pinnacle::Types::AttachWebhookByIdParams, Pinnacle::Types::CreateAndAttachWebhookByUrlParams]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ConfiguredWebhook]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.webhook.attach(phone: "%2B14155551234", request: { webhook_id: "wh_1234567890", event: MESSAGE_STATUS })
      def attach(phone:, request:, request_options: nil)
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
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/#{phone}/attach-webhook"
          end
          Pinnacle::Types::ConfiguredWebhook.from_json(json_object: response.body)
        end
      end

      # Disconnect a webhook from your phone number to stop receiving event
      #  notifications for that specific number. <br>
      #  The webhook configuration itself remains intact and available for use with other
      #  phone numbers.
      #
      # @param phone [String] The phone number you want to attach the webhook to in E.164 format. Make sure it
      #  is url encoded (i.e. replace the leading + with %2B). <br>
      #  Must be a phone number that you own and currently has the specified webhook
      #  attached.
      # @param webhook_id [String] The unique identifier of the webhook you want to detach from the phone number.
      #  <br>
      #  This must be a valid webhook ID that is currently attached to the specified
      #  phone number. This identifier is a string that always begins with the prefix
      #  `wh_`, for example: `wh_1234567890`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::DetachedWebhookInfo]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.phone_numbers.webhook.detach(phone: "+14155551234", webhook_id: "wh_1234567890")
      def detach(phone:, webhook_id:, request_options: nil)
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
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/#{phone}/detach-webhook/#{webhook_id}"
          end
          Pinnacle::Types::DetachedWebhookInfo.from_json(json_object: response.body)
        end
      end
    end
  end
end
