# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/get_conversation_params"
require_relative "../types/conversation"
require_relative "../types/campaign_enum"
require_relative "../types/conversation_list"
require_relative "../types/successful_conversation_update"
require_relative "types/conversations_list_messages_request_sort_order"
require_relative "types/conversations_list_messages_request_direction"
require_relative "types/conversations_list_messages_request_status"
require_relative "types/conversations_list_messages_request_type"
require "date"
require_relative "../types/message_list"
require "async"

module Pinnacle
  class ConversationsClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::ConversationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Fetch a specific conversation using either its unique identifier or by matching
    #  sender and recipient details.
    #
    # @param request [Pinnacle::Types::ConversationByIdParams, Pinnacle::Types::ConversationByParticipantsParams]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::Conversation]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.get(request: { id: "conv_1234567890" })
    def get(request:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/conversations/get"
      end
      Pinnacle::Types::Conversation.from_json(json_object: response.body)
    end

    # Retrieves conversations by page with optional filtering based off provided
    #  parameters.
    #
    # @param brand_id [String] The unique identifier of the brand to filter conversations. This identifier is a
    #  string that always begins with the prefix `b_`, for example: `b_1234567890`.
    # @param campaign_id [String] The unique identifier of the campaign to filter conversations. This identifier
    #  is a string that begins with the prefix:
    #  - TOLL_FREE: `tf_` (e.g., `tf_1234567890`)
    #  - 10DLC: `dlc_` (e.g., `dlc_1234567890`)
    #  - RCS: `rcs_` (e.g., `rcs_1234567890`)
    # @param campaign_type [Pinnacle::Types::CampaignEnum]
    # @param page_index [Integer] Zero-based index for pagination.
    # @param page_size [Integer] Number of conversations to return per page.
    # @param receiver [String] Receiver's phone number in E.164 format.
    # @param sender [String]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ConversationList]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.list(
    #    brand_id: "b_1234567890",
    #    campaign_id: "tf_1234567890",
    #    campaign_type: TOLL_FREE,
    #    page_index: 0,
    #    page_size: 20,
    #    receiver: "+16509231662",
    #    sender: "+18445551234"
    #  )
    def list(page_index:, brand_id: nil, campaign_id: nil, campaign_type: nil, page_size: nil, receiver: nil,
             sender: nil, request_options: nil)
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
          brandId: brand_id,
          campaignId: campaign_id,
          campaignType: campaign_type,
          pageIndex: page_index,
          pageSize: page_size,
          receiver: receiver,
          sender: sender
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/conversations/list"
      end
      Pinnacle::Types::ConversationList.from_json(json_object: response.body)
    end

    # Update the notes associated with a specific conversation.
    #
    # @param id [String] The unique identifier of the conversation to update. This identifier is a string
    #  that always begins with the prefix `conv_`, for example: `conv_1234567890`.
    # @param notes [String] New notes or comments for the conversation.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::SuccessfulConversationUpdate]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.update(id: "conv_1234567890", notes: "Follow-up completed. Customer satisfied with resolution.")
    def update(id:, notes:, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), id: id, notes: notes }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/conversations/update"
      end
      Pinnacle::Types::SuccessfulConversationUpdate.from_json(json_object: response.body)
    end

    # Retrieve a paginated and filtered list of messages for a specific conversation.
    #
    # @param id [String] Unique identifier of the conversation. This identifier is a string that always
    #  begins with the prefix `conv_`, for example: `conv_1234567890`.
    # @param page_index [Integer] Zero-based index for pagination.
    # @param page_size [Integer] Number of messages to return per page.
    # @param sort_order [Pinnacle::Conversations::Types::ConversationsListMessagesRequestSortOrder] Sort order for messages. <br>
    #  - `asc`: Oldest messages first
    #  - `desc`: Newest messages first (default)
    # @param direction [Pinnacle::Conversations::Types::ConversationsListMessagesRequestDirection] Filter messages by direction. <br>
    #  - `INBOUND`: Messages received from contacts
    #  - `OUTBOUND`: Messages sent to contacts
    # @param status [Pinnacle::Conversations::Types::ConversationsListMessagesRequestStatus] Filter messages by delivery status.
    # @param type [Pinnacle::Conversations::Types::ConversationsListMessagesRequestType] Filter messages by protocol type.
    # @param date_from [DateTime] Filter messages sent on or after this date (ISO 8601 format).
    # @param date_to [DateTime] Filter messages sent on or before this date (ISO 8601 format).
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::MessageList]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.list_messages(id: "id")
    def list_messages(id:, page_index: nil, page_size: nil, sort_order: nil, direction: nil, status: nil, type: nil,
                      date_from: nil, date_to: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "pageIndex": page_index,
          "pageSize": page_size,
          "sortOrder": sort_order,
          "direction": direction,
          "status": status,
          "type": type,
          "dateFrom": date_from,
          "dateTo": date_to
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/conversations/#{id}/messages"
      end
      Pinnacle::Types::MessageList.from_json(json_object: response.body)
    end
  end

  class AsyncConversationsClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncConversationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Fetch a specific conversation using either its unique identifier or by matching
    #  sender and recipient details.
    #
    # @param request [Pinnacle::Types::ConversationByIdParams, Pinnacle::Types::ConversationByParticipantsParams]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::Conversation]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.get(request: { id: "conv_1234567890" })
    def get(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/conversations/get"
        end
        Pinnacle::Types::Conversation.from_json(json_object: response.body)
      end
    end

    # Retrieves conversations by page with optional filtering based off provided
    #  parameters.
    #
    # @param brand_id [String] The unique identifier of the brand to filter conversations. This identifier is a
    #  string that always begins with the prefix `b_`, for example: `b_1234567890`.
    # @param campaign_id [String] The unique identifier of the campaign to filter conversations. This identifier
    #  is a string that begins with the prefix:
    #  - TOLL_FREE: `tf_` (e.g., `tf_1234567890`)
    #  - 10DLC: `dlc_` (e.g., `dlc_1234567890`)
    #  - RCS: `rcs_` (e.g., `rcs_1234567890`)
    # @param campaign_type [Pinnacle::Types::CampaignEnum]
    # @param page_index [Integer] Zero-based index for pagination.
    # @param page_size [Integer] Number of conversations to return per page.
    # @param receiver [String] Receiver's phone number in E.164 format.
    # @param sender [String]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::ConversationList]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.list(
    #    brand_id: "b_1234567890",
    #    campaign_id: "tf_1234567890",
    #    campaign_type: TOLL_FREE,
    #    page_index: 0,
    #    page_size: 20,
    #    receiver: "+16509231662",
    #    sender: "+18445551234"
    #  )
    def list(page_index:, brand_id: nil, campaign_id: nil, campaign_type: nil, page_size: nil, receiver: nil,
             sender: nil, request_options: nil)
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
            brandId: brand_id,
            campaignId: campaign_id,
            campaignType: campaign_type,
            pageIndex: page_index,
            pageSize: page_size,
            receiver: receiver,
            sender: sender
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/conversations/list"
        end
        Pinnacle::Types::ConversationList.from_json(json_object: response.body)
      end
    end

    # Update the notes associated with a specific conversation.
    #
    # @param id [String] The unique identifier of the conversation to update. This identifier is a string
    #  that always begins with the prefix `conv_`, for example: `conv_1234567890`.
    # @param notes [String] New notes or comments for the conversation.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::SuccessfulConversationUpdate]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.update(id: "conv_1234567890", notes: "Follow-up completed. Customer satisfied with resolution.")
    def update(id:, notes:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), id: id, notes: notes }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/conversations/update"
        end
        Pinnacle::Types::SuccessfulConversationUpdate.from_json(json_object: response.body)
      end
    end

    # Retrieve a paginated and filtered list of messages for a specific conversation.
    #
    # @param id [String] Unique identifier of the conversation. This identifier is a string that always
    #  begins with the prefix `conv_`, for example: `conv_1234567890`.
    # @param page_index [Integer] Zero-based index for pagination.
    # @param page_size [Integer] Number of messages to return per page.
    # @param sort_order [Pinnacle::Conversations::Types::ConversationsListMessagesRequestSortOrder] Sort order for messages. <br>
    #  - `asc`: Oldest messages first
    #  - `desc`: Newest messages first (default)
    # @param direction [Pinnacle::Conversations::Types::ConversationsListMessagesRequestDirection] Filter messages by direction. <br>
    #  - `INBOUND`: Messages received from contacts
    #  - `OUTBOUND`: Messages sent to contacts
    # @param status [Pinnacle::Conversations::Types::ConversationsListMessagesRequestStatus] Filter messages by delivery status.
    # @param type [Pinnacle::Conversations::Types::ConversationsListMessagesRequestType] Filter messages by protocol type.
    # @param date_from [DateTime] Filter messages sent on or after this date (ISO 8601 format).
    # @param date_to [DateTime] Filter messages sent on or before this date (ISO 8601 format).
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::MessageList]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.list_messages(id: "id")
    def list_messages(id:, page_index: nil, page_size: nil, sort_order: nil, direction: nil, status: nil, type: nil,
                      date_from: nil, date_to: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "pageIndex": page_index,
            "pageSize": page_size,
            "sortOrder": sort_order,
            "direction": direction,
            "status": status,
            "type": type,
            "dateFrom": date_from,
            "dateTo": date_to
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/conversations/#{id}/messages"
        end
        Pinnacle::Types::MessageList.from_json(json_object: response.body)
      end
    end
  end
end
