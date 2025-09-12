# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/send_sms_schema_options"
require_relative "types/send_sms_response"
require_relative "types/send_mms_schema_options"
require_relative "types/send_mms_response"
require_relative "../../types/rcs"
require_relative "types/send_rcs_response"
require "async"

module Pinnacle
  module Messages
    class SendClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Messages::SendClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a SMS message immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number that sends the message in E.164 format.
      # @param options [Hash] Additional settings to customize SMS delivery.Request of type Pinnacle::Messages::Send::Types::SendSmsSchemaOptions, as a Hash
      #   * :schedule (Hash)
      #     * :end_date (DateTime)
      #     * :recurrence (String)
      #     * :send_at (String)
      #     * :timezone (String)
      #   * :tracking (Pinnacle::Types::Tracking)
      # @param text [String] Message content.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentSmsDetails, Pinnacle::Types::ScheduledMessaage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.send.sms(
      #    from: "+14155164736",
      #    text: "Hey! 😂",
      #    to: "+14154746461"
      #  )
      def sms(from:, text:, to:, options: nil, request_options: nil)
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
            from: from,
            options: options,
            text: text,
            to: to
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/sms"
        end
        Pinnacle::Messages::Send::Types::SendSmsResponse.from_json(json_object: response.body)
      end

      # Send a MMS immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number you want to send the message from in E.164 format.
      # @param media_urls [Array<String>] Media file URLs to send.<br>
      #  See [supported media
      #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
      # @param options [Hash] Control how your MMS is processed and delivered.Request of type Pinnacle::Messages::Send::Types::SendMmsSchemaOptions, as a Hash
      #   * :multiple_messages (Boolean)
      #   * :schedule (Hash)
      #     * :end_date (DateTime)
      #     * :recurrence (String)
      #     * :send_at (String)
      #     * :timezone (String)
      #   * :tracking (Pinnacle::Types::Tracking)
      #   * :validate (Boolean)
      # @param text [String] Message text to accompany the media.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentMmsDetails, Pinnacle::Types::ScheduledMessaage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.send.mms(
      #    from: "+14155164736",
      #    media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg?hmac=mDxM9PWSqRDjecwSCEpzU4bj35gqnG7yA25OL29uNv0"],
      #    options: { multiple_messages: true, validate: true },
      #    text: "Check out this image!",
      #    to: "+14154746461"
      #  )
      def mms(from:, media_urls:, text:, to:, options: nil, request_options: nil)
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
            from: from,
            mediaUrls: media_urls,
            options: options,
            text: text,
            to: to
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/mms"
        end
        Pinnacle::Messages::Send::Types::SendMmsResponse.from_json(json_object: response.body)
      end

      # Send a RCS message immediately or schedule it for future delivery. <br>
      #  Requires an active RCS agent and recipient devices that support RCS Business
      #  Messaging.
      #
      # @param request [Pinnacle::Types::RcsText, Pinnacle::Types::RcsMedia, Pinnacle::Types::RcsCard]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentRcsDetails, Pinnacle::Types::ScheduledMessaage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.send.rcs(request: { quick_replies: , text: "text", from: "from", to: "to" })
      def rcs(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/rcs"
        end
        Pinnacle::Messages::Send::Types::SendRcsResponse.from_json(json_object: response.body)
      end
    end

    class AsyncSendClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Messages::AsyncSendClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a SMS message immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number that sends the message in E.164 format.
      # @param options [Hash] Additional settings to customize SMS delivery.Request of type Pinnacle::Messages::Send::Types::SendSmsSchemaOptions, as a Hash
      #   * :schedule (Hash)
      #     * :end_date (DateTime)
      #     * :recurrence (String)
      #     * :send_at (String)
      #     * :timezone (String)
      #   * :tracking (Pinnacle::Types::Tracking)
      # @param text [String] Message content.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentSmsDetails, Pinnacle::Types::ScheduledMessaage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.send.sms(
      #    from: "+14155164736",
      #    text: "Hey! 😂",
      #    to: "+14154746461"
      #  )
      def sms(from:, text:, to:, options: nil, request_options: nil)
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
              from: from,
              options: options,
              text: text,
              to: to
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/sms"
          end
          Pinnacle::Messages::Send::Types::SendSmsResponse.from_json(json_object: response.body)
        end
      end

      # Send a MMS immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number you want to send the message from in E.164 format.
      # @param media_urls [Array<String>] Media file URLs to send.<br>
      #  See [supported media
      #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
      # @param options [Hash] Control how your MMS is processed and delivered.Request of type Pinnacle::Messages::Send::Types::SendMmsSchemaOptions, as a Hash
      #   * :multiple_messages (Boolean)
      #   * :schedule (Hash)
      #     * :end_date (DateTime)
      #     * :recurrence (String)
      #     * :send_at (String)
      #     * :timezone (String)
      #   * :tracking (Pinnacle::Types::Tracking)
      #   * :validate (Boolean)
      # @param text [String] Message text to accompany the media.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentMmsDetails, Pinnacle::Types::ScheduledMessaage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.send.mms(
      #    from: "+14155164736",
      #    media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg?hmac=mDxM9PWSqRDjecwSCEpzU4bj35gqnG7yA25OL29uNv0"],
      #    options: { multiple_messages: true, validate: true },
      #    text: "Check out this image!",
      #    to: "+14154746461"
      #  )
      def mms(from:, media_urls:, text:, to:, options: nil, request_options: nil)
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
              from: from,
              mediaUrls: media_urls,
              options: options,
              text: text,
              to: to
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/mms"
          end
          Pinnacle::Messages::Send::Types::SendMmsResponse.from_json(json_object: response.body)
        end
      end

      # Send a RCS message immediately or schedule it for future delivery. <br>
      #  Requires an active RCS agent and recipient devices that support RCS Business
      #  Messaging.
      #
      # @param request [Pinnacle::Types::RcsText, Pinnacle::Types::RcsMedia, Pinnacle::Types::RcsCard]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentRcsDetails, Pinnacle::Types::ScheduledMessaage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.send.rcs(request: { quick_replies: , text: "text", from: "from", to: "to" })
      def rcs(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/rcs"
          end
          Pinnacle::Messages::Send::Types::SendRcsResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
