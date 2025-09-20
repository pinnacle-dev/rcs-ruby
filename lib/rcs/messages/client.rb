# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/message"
require_relative "types/react_message_options"
require_relative "../types/reaction_result"
require "async"

module Pinnacle
  class MessagesClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::MessagesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve a previously sent message.
    #
    # @param id [Integer] Unique identifier of the message.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::Message]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.messages.get(id: 1240)
    def get(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/messages/#{id}"
      end
      Pinnacle::Types::Message.from_json(json_object: response.body)
    end

    # Add or remove an emoji reaction to a previously sent message.
    #
    # @param message_id [Integer] Unique identifier of the message.
    # @param options [Hash] Request of type Pinnacle::Messages::Types::ReactMessageOptions, as a Hash
    #   * :force (Boolean)
    # @param reaction [String] Unicode emoji to add. <br>
    #  Use `null` to remove existing reaction.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ReactionResult]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.messages.react(
    #    message_id: 1410,
    #    options: { force: true },
    #    reaction: "👍"
    #  )
    def react(message_id:, options: nil, reaction: nil, request_options: nil)
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
          messageId: message_id,
          options: options,
          reaction: reaction
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/messages/react"
      end
      Pinnacle::Types::ReactionResult.from_json(json_object: response.body)
    end
  end

  class AsyncMessagesClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncMessagesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve a previously sent message.
    #
    # @param id [Integer] Unique identifier of the message.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::Message]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.messages.get(id: 1240)
    def get(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/#{id}"
        end
        Pinnacle::Types::Message.from_json(json_object: response.body)
      end
    end

    # Add or remove an emoji reaction to a previously sent message.
    #
    # @param message_id [Integer] Unique identifier of the message.
    # @param options [Hash] Request of type Pinnacle::Messages::Types::ReactMessageOptions, as a Hash
    #   * :force (Boolean)
    # @param reaction [String] Unicode emoji to add. <br>
    #  Use `null` to remove existing reaction.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ReactionResult]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.messages.react(
    #    message_id: 1410,
    #    options: { force: true },
    #    reaction: "👍"
    #  )
    def react(message_id:, options: nil, reaction: nil, request_options: nil)
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
            messageId: message_id,
            options: options,
            reaction: reaction
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/react"
        end
        Pinnacle::Types::ReactionResult.from_json(json_object: response.body)
      end
    end
  end
end
