# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/send_mms_options"
require_relative "types/mms_send_response"
require_relative "../../types/mms_content"
require_relative "../../types/mms_validation_result"
require "async"

module Pinnacle
  module Messages
    class MmsClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Messages::MmsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a MMS immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number you want to send the message from in E.164 format.
      # @param media_urls [Array<String>] Media file URLs to send.<br>
      #  See [supported media
      #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
      # @param options [Hash] Control how your MMS is processed and delivered.Request of type Pinnacle::Messages::Mms::Types::SendMmsOptions, as a Hash
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
      #  api.messages.mms.send_(
      #    from: "+14155164736",
      #    media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg?hmac=mDxM9PWSqRDjecwSCEpzU4bj35gqnG7yA25OL29uNv0"],
      #    options: { multiple_messages: true, validate: true },
      #    text: "Check out this image!",
      #    to: "+14154746461"
      #  )
      def send_(from:, media_urls:, text:, to:, options: nil, request_options: nil)
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
        Pinnacle::Messages::Mms::Types::MmsSendResponse.from_json(json_object: response.body)
      end

      # Validate MMS message content without sending it.
      #
      # @param request [Hash] Request of type Pinnacle::Types::MmsContent, as a Hash
      #   * :media_urls (Array<String>)
      #   * :text (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::MmsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.mms.validate(request: { media_urls: ["https://upload.wikimedia.org/wikipedia/commons/b/b9/Pizigani_1367_Chart_1MB.jpg", "https://fastly.picsum.photos/id/528/1000/1000.jpg?hmac=aTG0xNif9KbNryFN0ZNZ_nFK6aEpZxqUGCZF1KjOT8w", "https://file-examples.com/storage/fefdd7ab126835e7993bb1a/2017/10/file_example_JPG_500kB.jpg"], text: "Check out these images!" })
      def validate(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/validate/mms"
        end
        Pinnacle::Types::MmsValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncMmsClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Messages::AsyncMmsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a MMS immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number you want to send the message from in E.164 format.
      # @param media_urls [Array<String>] Media file URLs to send.<br>
      #  See [supported media
      #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
      # @param options [Hash] Control how your MMS is processed and delivered.Request of type Pinnacle::Messages::Mms::Types::SendMmsOptions, as a Hash
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
      #  api.messages.mms.send_(
      #    from: "+14155164736",
      #    media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg?hmac=mDxM9PWSqRDjecwSCEpzU4bj35gqnG7yA25OL29uNv0"],
      #    options: { multiple_messages: true, validate: true },
      #    text: "Check out this image!",
      #    to: "+14154746461"
      #  )
      def send_(from:, media_urls:, text:, to:, options: nil, request_options: nil)
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
          Pinnacle::Messages::Mms::Types::MmsSendResponse.from_json(json_object: response.body)
        end
      end

      # Validate MMS message content without sending it.
      #
      # @param request [Hash] Request of type Pinnacle::Types::MmsContent, as a Hash
      #   * :media_urls (Array<String>)
      #   * :text (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::MmsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.mms.validate(request: { media_urls: ["https://upload.wikimedia.org/wikipedia/commons/b/b9/Pizigani_1367_Chart_1MB.jpg", "https://fastly.picsum.photos/id/528/1000/1000.jpg?hmac=aTG0xNif9KbNryFN0ZNZ_nFK6aEpZxqUGCZF1KjOT8w", "https://file-examples.com/storage/fefdd7ab126835e7993bb1a/2017/10/file_example_JPG_500kB.jpg"], text: "Check out these images!" })
      def validate(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/validate/mms"
          end
          Pinnacle::Types::MmsValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
