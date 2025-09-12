# frozen_string_literal: true

require_relative "../../../requests"
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
