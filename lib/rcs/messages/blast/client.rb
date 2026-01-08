# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/sms_content"
require_relative "types/blast_sms_options"
require_relative "types/blast_sms_response"
require_relative "../../types/mms_content"
require_relative "types/blast_mms_options"
require_relative "types/blast_mms_response"
require_relative "../../types/rcs_validate_content"
require_relative "types/blast_rcs_options"
require_relative "types/blast_rcs_response"
require "async"

module Pinnacle
  module Messages
    class BlastClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Messages::BlastClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send an SMS message to all contacts in an audience. <br>
      #  Messages are distributed evenly across the provided sender phone numbers. <br>
      #  Use the optional `schedule` parameter in `options` to schedule the blast for
      #  future delivery. When scheduled, the response will contain a `scheduleId`
      #  instead of blast details.
      #
      # @param audience_id [String] The audience ID to send the blast to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`. <br>
      #  You can create an audience via [the
      #  dashboard](https://app.pinnacle.sh/dashboard/audiences) or
      #  [API](/api-reference/audiences/create).
      # @param senders [Array<String>] Array of phone numbers to send from in E.164 format. <br>
      #  Messages will be distributed evenly across these senders.
      #  > **Note:** Sandbox numbers cannot be used for blasts.
      #  **Limit:** 1 min
      # @param message [Hash] Request of type Pinnacle::Types::SmsContent, as a Hash
      #   * :text (String)
      # @param options [Hash] Additional settings to customize SMS blast delivery.Request of type Pinnacle::Messages::Blast::Types::BlastSmsOptions, as a Hash
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BlastDetails, Pinnacle::Types::ScheduledBlastDetails]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.blast.sms(
      #    audience_id: "aud_abc123",
      #    senders: ["+14155164736", "+14155164737"],
      #    message: { text: "Hello from Pinnacle!" }
      #  )
      def sms(audience_id:, senders:, message:, options: nil, request_options: nil)
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
            audienceId: audience_id,
            senders: senders,
            message: message,
            options: options
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/blast/sms"
        end
        Pinnacle::Messages::Blast::Types::BlastSmsResponse.from_json(json_object: response.body)
      end

      # Send an MMS message to all contacts in an audience. <br>
      #  Messages are distributed evenly across the provided sender phone numbers. <br>
      #  Use the optional `schedule` parameter in `options` to schedule the blast for
      #  future delivery. When scheduled, the response will contain a `scheduleId`
      #  instead of blast details.
      #
      # @param audience_id [String] The audience ID to send the blast to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`. <br>
      #  You can create an audience via [the
      #  dashboard](https://app.pinnacle.sh/dashboard/audiences) or
      #  [API](/api-reference/audiences/create).
      # @param senders [Array<String>] Array of phone numbers to send from in E.164 format. <br>
      #  Messages will be distributed evenly across these senders.
      #  > **Note:** Sandbox numbers cannot be used for blasts.
      #  **Limit:** 1 min
      # @param message [Hash] Request of type Pinnacle::Types::MmsContent, as a Hash
      #   * :media_urls (Array<String>)
      #   * :text (String)
      # @param options [Hash] Additional settings to customize MMS blast delivery.Request of type Pinnacle::Messages::Blast::Types::BlastMmsOptions, as a Hash
      #   * :validate (Boolean)
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BlastDetails, Pinnacle::Types::ScheduledBlastDetails]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.blast.mms(
      #    audience_id: "aud_abc123",
      #    senders: ["+14155164736", "+14155164737"],
      #    message: { media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg"], text: "Check out this image!" },
      #    options: { validate: true }
      #  )
      def mms(audience_id:, senders:, message:, options: nil, request_options: nil)
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
            audienceId: audience_id,
            senders: senders,
            message: message,
            options: options
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/blast/mms"
        end
        Pinnacle::Messages::Blast::Types::BlastMmsResponse.from_json(json_object: response.body)
      end

      # Send an RCS message to all contacts in an audience. <br>
      #  Messages are distributed evenly across the provided RCS agents for load
      #  balancing. Requires active RCS agents and recipient devices that support RCS
      #  Business Messaging. <br>
      #  Use the optional `schedule` parameter in `options` to schedule the blast for
      #  future delivery. When scheduled, the response will contain a `scheduleId`
      #  instead of blast details.
      #
      # @param audience_id [String] The audience ID to send the blast to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`. <br>
      #  You can create an audience via [the
      #  dashboard](https://app.pinnacle.sh/dashboard/audiences) or
      #  [API](/api-reference/audiences/create).
      # @param senders [Array<String>] Array of RCS agent IDs to send from. Each must be prefixed with `agent_`. <br>
      #  Messages will be evenly distributed across these agents.
      #  > **Note:** Test agents cannot be used for blasts.
      #  **Limit:** 1 min
      # @param message [Pinnacle::Types::RichText, Pinnacle::Types::RcsValidateContentMedia, Pinnacle::Types::RichCards]
      # @param options [Hash] Configure how your RCS blast is sent and tracked.Request of type Pinnacle::Messages::Blast::Types::BlastRcsOptions, as a Hash
      #   * :transcode (Boolean)
      #   * :validate (Boolean)
      #   * :standalone_card (Hash)
      #     * :orientation (Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardOrientation)
      #     * :image_alignment (Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardImageAlignment)
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BlastDetails, Pinnacle::Types::ScheduledBlastDetails]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.blast.rcs(
      #    audience_id: "aud_abc123",
      #    senders: ["agent_pinnacle", "agent_pinnacle2"],
      #    message: { quick_replies: , text: "Hello from Pinnacle RCS!" },
      #    options: { transcode: true, validate: true }
      #  )
      def rcs(audience_id:, senders:, message:, options: nil, request_options: nil)
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
            audienceId: audience_id,
            senders: senders,
            message: message,
            options: options
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/blast/rcs"
        end
        Pinnacle::Messages::Blast::Types::BlastRcsResponse.from_json(json_object: response.body)
      end
    end

    class AsyncBlastClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Messages::AsyncBlastClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send an SMS message to all contacts in an audience. <br>
      #  Messages are distributed evenly across the provided sender phone numbers. <br>
      #  Use the optional `schedule` parameter in `options` to schedule the blast for
      #  future delivery. When scheduled, the response will contain a `scheduleId`
      #  instead of blast details.
      #
      # @param audience_id [String] The audience ID to send the blast to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`. <br>
      #  You can create an audience via [the
      #  dashboard](https://app.pinnacle.sh/dashboard/audiences) or
      #  [API](/api-reference/audiences/create).
      # @param senders [Array<String>] Array of phone numbers to send from in E.164 format. <br>
      #  Messages will be distributed evenly across these senders.
      #  > **Note:** Sandbox numbers cannot be used for blasts.
      #  **Limit:** 1 min
      # @param message [Hash] Request of type Pinnacle::Types::SmsContent, as a Hash
      #   * :text (String)
      # @param options [Hash] Additional settings to customize SMS blast delivery.Request of type Pinnacle::Messages::Blast::Types::BlastSmsOptions, as a Hash
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BlastDetails, Pinnacle::Types::ScheduledBlastDetails]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.blast.sms(
      #    audience_id: "aud_abc123",
      #    senders: ["+14155164736", "+14155164737"],
      #    message: { text: "Hello from Pinnacle!" }
      #  )
      def sms(audience_id:, senders:, message:, options: nil, request_options: nil)
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
              audienceId: audience_id,
              senders: senders,
              message: message,
              options: options
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/blast/sms"
          end
          Pinnacle::Messages::Blast::Types::BlastSmsResponse.from_json(json_object: response.body)
        end
      end

      # Send an MMS message to all contacts in an audience. <br>
      #  Messages are distributed evenly across the provided sender phone numbers. <br>
      #  Use the optional `schedule` parameter in `options` to schedule the blast for
      #  future delivery. When scheduled, the response will contain a `scheduleId`
      #  instead of blast details.
      #
      # @param audience_id [String] The audience ID to send the blast to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`. <br>
      #  You can create an audience via [the
      #  dashboard](https://app.pinnacle.sh/dashboard/audiences) or
      #  [API](/api-reference/audiences/create).
      # @param senders [Array<String>] Array of phone numbers to send from in E.164 format. <br>
      #  Messages will be distributed evenly across these senders.
      #  > **Note:** Sandbox numbers cannot be used for blasts.
      #  **Limit:** 1 min
      # @param message [Hash] Request of type Pinnacle::Types::MmsContent, as a Hash
      #   * :media_urls (Array<String>)
      #   * :text (String)
      # @param options [Hash] Additional settings to customize MMS blast delivery.Request of type Pinnacle::Messages::Blast::Types::BlastMmsOptions, as a Hash
      #   * :validate (Boolean)
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BlastDetails, Pinnacle::Types::ScheduledBlastDetails]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.blast.mms(
      #    audience_id: "aud_abc123",
      #    senders: ["+14155164736", "+14155164737"],
      #    message: { media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg"], text: "Check out this image!" },
      #    options: { validate: true }
      #  )
      def mms(audience_id:, senders:, message:, options: nil, request_options: nil)
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
              audienceId: audience_id,
              senders: senders,
              message: message,
              options: options
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/blast/mms"
          end
          Pinnacle::Messages::Blast::Types::BlastMmsResponse.from_json(json_object: response.body)
        end
      end

      # Send an RCS message to all contacts in an audience. <br>
      #  Messages are distributed evenly across the provided RCS agents for load
      #  balancing. Requires active RCS agents and recipient devices that support RCS
      #  Business Messaging. <br>
      #  Use the optional `schedule` parameter in `options` to schedule the blast for
      #  future delivery. When scheduled, the response will contain a `scheduleId`
      #  instead of blast details.
      #
      # @param audience_id [String] The audience ID to send the blast to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`. <br>
      #  You can create an audience via [the
      #  dashboard](https://app.pinnacle.sh/dashboard/audiences) or
      #  [API](/api-reference/audiences/create).
      # @param senders [Array<String>] Array of RCS agent IDs to send from. Each must be prefixed with `agent_`. <br>
      #  Messages will be evenly distributed across these agents.
      #  > **Note:** Test agents cannot be used for blasts.
      #  **Limit:** 1 min
      # @param message [Pinnacle::Types::RichText, Pinnacle::Types::RcsValidateContentMedia, Pinnacle::Types::RichCards]
      # @param options [Hash] Configure how your RCS blast is sent and tracked.Request of type Pinnacle::Messages::Blast::Types::BlastRcsOptions, as a Hash
      #   * :transcode (Boolean)
      #   * :validate (Boolean)
      #   * :standalone_card (Hash)
      #     * :orientation (Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardOrientation)
      #     * :image_alignment (Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardImageAlignment)
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::BlastDetails, Pinnacle::Types::ScheduledBlastDetails]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.blast.rcs(
      #    audience_id: "aud_abc123",
      #    senders: ["agent_pinnacle", "agent_pinnacle2"],
      #    message: { quick_replies: , text: "Hello from Pinnacle RCS!" },
      #    options: { transcode: true, validate: true }
      #  )
      def rcs(audience_id:, senders:, message:, options: nil, request_options: nil)
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
              audienceId: audience_id,
              senders: senders,
              message: message,
              options: options
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/blast/rcs"
          end
          Pinnacle::Messages::Blast::Types::BlastRcsResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
