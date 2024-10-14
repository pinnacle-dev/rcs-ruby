# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/card"
require_relative "../types/action"
require_relative "types/send_rcs_response"
require_relative "types/send_sms_response"
require_relative "types/send_mms_response"
require "async"

module Pinnacle
  class SendClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::SendClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Send an interactive RCS message with text, media, or cards. Each message can
    #  only contain either text, media, or card(s).
    #  Quick replies can also be added to the message.
    #
    # @param from [String] The id of the RCS agent sending the message.
    #  Use 'test' if you want to send from the Pinnacle test agent. The test agent can
    #  only send to whitelisted test numbers.
    #  See https://dashboard.trypinnacle.app/settings/test-numbers to whitelist a
    #  number.
    # @param to [String] The recipient's RCS-enabled phone number in E.164 format (e.g., +12345678901).
    # @param text [String] Text content of the message.
    #  Make sure you have either 'text', 'mediaUrl', or 'cards'. An error will be
    #  thrown if multiple (i.e. both 'text' and 'mediaUrl') is provided.
    # @param media_url [String] Media URL to be included in the message.
    #  Make sure you have either 'text', 'mediaUrl', or 'cards'. An error will be
    #  thrown if multiple (i.e. both 'text' and 'mediaUrl') is provided.
    # @param cards [Array<Hash>] List of rich cards. Maximum of 10 cards.
    #  Make sure you have either 'text', 'mediaUrl', or 'cards'. An error will be
    #  thrown if multiple (i.e. both 'text' and 'mediaUrl') is provided.Request of type Array<Pinnacle::Card>, as a Hash
    #   * :title (String)
    #   * :subtitle (String)
    #   * :media_url (String)
    #   * :buttons (Array<Pinnacle::Action>)
    # @param quick_replies [Array<Hash>] Optional list of quick reply actions (max 10).Request of type Array<Pinnacle::Action>, as a Hash
    #   * :title (String)
    #   * :type (Pinnacle::ActionType)
    #   * :payload (String)
    #   * :metadata (String)
    #   * :event_start_time (String)
    #   * :event_end_time (String)
    #   * :event_title (String)
    #   * :event_description (String)
    #   * :lat_long (Hash)
    #     * :lat (Float)
    #     * :lng (Float)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Send::SendRcsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send.rcs(from: "from", to: "to")
    def rcs(from:, to:, text: nil, media_url: nil, cards: nil, quick_replies: nil, request_options: nil)
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
          from: from,
          to: to,
          text: text,
          mediaUrl: media_url,
          cards: cards,
          quickReplies: quick_replies
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/send/rcs"
      end
      Pinnacle::Send::SendRcsResponse.from_json(json_object: response.body)
    end

    # Send an SMS message to a recipient.
    #
    # @param to [String] The recipient's phone number in E.164 format (e.g., +12345678901).
    # @param from [String] The sender's phone number in E.164 format. Must be owned by the user.
    # @param text [String] The SMS message content (max 1600 characters).
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Send::SendSmsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send.sms(
    #    to: "to",
    #    from: "from",
    #    text: "text"
    #  )
    def sms(to:, from:, text:, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), to: to, from: from, text: text }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/send/sms"
      end
      Pinnacle::Send::SendSmsResponse.from_json(json_object: response.body)
    end

    # Send an MMS message with media attachments.
    #
    # @param to [String] The recipient's phone number in E.164 format (e.g., +12345678901).
    # @param from [String] The sender's phone number in E.164 format. Must be owned by the user.
    # @param text [String] The MMS message content (max 1600 characters).
    # @param media_urls [Array<String>] The URLs of media to include. `jpeg`, `jpg`, `gif`, and `png` file types are
    #  fully supported and have a size limit of 5 MB. 500 KB limit for other types. Up
    #  to 10 media URLs can be included.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Send::SendMmsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send.mms(
    #    to: "to",
    #    from: "from",
    #    text: "text",
    #    media_urls: ["https://example.com/image1.jpg", "https://example.com/video.mp4"]
    #  )
    def mms(to:, from:, text:, media_urls:, request_options: nil)
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
          to: to,
          from: from,
          text: text,
          mediaUrls: media_urls
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/send/mms"
      end
      Pinnacle::Send::SendMmsResponse.from_json(json_object: response.body)
    end
  end

  class AsyncSendClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncSendClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Send an interactive RCS message with text, media, or cards. Each message can
    #  only contain either text, media, or card(s).
    #  Quick replies can also be added to the message.
    #
    # @param from [String] The id of the RCS agent sending the message.
    #  Use 'test' if you want to send from the Pinnacle test agent. The test agent can
    #  only send to whitelisted test numbers.
    #  See https://dashboard.trypinnacle.app/settings/test-numbers to whitelist a
    #  number.
    # @param to [String] The recipient's RCS-enabled phone number in E.164 format (e.g., +12345678901).
    # @param text [String] Text content of the message.
    #  Make sure you have either 'text', 'mediaUrl', or 'cards'. An error will be
    #  thrown if multiple (i.e. both 'text' and 'mediaUrl') is provided.
    # @param media_url [String] Media URL to be included in the message.
    #  Make sure you have either 'text', 'mediaUrl', or 'cards'. An error will be
    #  thrown if multiple (i.e. both 'text' and 'mediaUrl') is provided.
    # @param cards [Array<Hash>] List of rich cards. Maximum of 10 cards.
    #  Make sure you have either 'text', 'mediaUrl', or 'cards'. An error will be
    #  thrown if multiple (i.e. both 'text' and 'mediaUrl') is provided.Request of type Array<Pinnacle::Card>, as a Hash
    #   * :title (String)
    #   * :subtitle (String)
    #   * :media_url (String)
    #   * :buttons (Array<Pinnacle::Action>)
    # @param quick_replies [Array<Hash>] Optional list of quick reply actions (max 10).Request of type Array<Pinnacle::Action>, as a Hash
    #   * :title (String)
    #   * :type (Pinnacle::ActionType)
    #   * :payload (String)
    #   * :metadata (String)
    #   * :event_start_time (String)
    #   * :event_end_time (String)
    #   * :event_title (String)
    #   * :event_description (String)
    #   * :lat_long (Hash)
    #     * :lat (Float)
    #     * :lng (Float)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Send::SendRcsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send.rcs(from: "from", to: "to")
    def rcs(from:, to:, text: nil, media_url: nil, cards: nil, quick_replies: nil, request_options: nil)
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
            from: from,
            to: to,
            text: text,
            mediaUrl: media_url,
            cards: cards,
            quickReplies: quick_replies
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/send/rcs"
        end
        Pinnacle::Send::SendRcsResponse.from_json(json_object: response.body)
      end
    end

    # Send an SMS message to a recipient.
    #
    # @param to [String] The recipient's phone number in E.164 format (e.g., +12345678901).
    # @param from [String] The sender's phone number in E.164 format. Must be owned by the user.
    # @param text [String] The SMS message content (max 1600 characters).
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Send::SendSmsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send.sms(
    #    to: "to",
    #    from: "from",
    #    text: "text"
    #  )
    def sms(to:, from:, text:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), to: to, from: from, text: text }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/send/sms"
        end
        Pinnacle::Send::SendSmsResponse.from_json(json_object: response.body)
      end
    end

    # Send an MMS message with media attachments.
    #
    # @param to [String] The recipient's phone number in E.164 format (e.g., +12345678901).
    # @param from [String] The sender's phone number in E.164 format. Must be owned by the user.
    # @param text [String] The MMS message content (max 1600 characters).
    # @param media_urls [Array<String>] The URLs of media to include. `jpeg`, `jpg`, `gif`, and `png` file types are
    #  fully supported and have a size limit of 5 MB. 500 KB limit for other types. Up
    #  to 10 media URLs can be included.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Send::SendMmsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send.mms(
    #    to: "to",
    #    from: "from",
    #    text: "text",
    #    media_urls: ["https://example.com/image1.jpg", "https://example.com/video.mp4"]
    #  )
    def mms(to:, from:, text:, media_urls:, request_options: nil)
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
            to: to,
            from: from,
            text: text,
            mediaUrls: media_urls
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/send/mms"
        end
        Pinnacle::Send::SendMmsResponse.from_json(json_object: response.body)
      end
    end
  end
end
