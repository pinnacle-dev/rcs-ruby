# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/get_conversation_params"
require_relative "../types/conversation"
require_relative "../types/campaign_enum"
require_relative "../types/conversation_list"
require_relative "../types/successful_conversation_update"
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
    # @param request [Pinnacle::GetConversationRequestId, Pinnacle::GetConversationRequestRecipient]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Conversation]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.get(request: { id: 1 })
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
      Pinnacle::Conversation.from_json(json_object: response.body)
    end

    # Retrieves conversations by page with optional filtering based off provided
    #  parameters.
    #
    # @param brand_id [Integer] The unique identifier of the brand to filter conversations.
    # @param campaign_id [Integer] The unique identifier of the campaign to filter conversations.
    # @param campaign_type [Pinnacle::CampaignEnum]
    # @param page_index [Integer] Zero-based index for pagination.
    # @param page_size [Integer] Number of conversations to return per page.
    # @param receiver [String] Receiver's phone number in E.164 format.
    # @param sender [String]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::ConversationList]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.list(
    #    brand_id: 101,
    #    campaign_id: 136,
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
      Pinnacle::ConversationList.from_json(json_object: response.body)
    end

    # Update the notes associated with a specific conversation.
    #
    # @param id [Integer] The unique identifier of the conversation to update.
    # @param notes [String] New notes or comments for the conversation.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::SuccessfulConversationUpdate]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.update(id: 123, notes: "Follow-up completed. Customer satisfied with resolution.")
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
      Pinnacle::SuccessfulConversationUpdate.from_json(json_object: response.body)
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
    # @param request [Pinnacle::GetConversationRequestId, Pinnacle::GetConversationRequestRecipient]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Conversation]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.get(request: { id: 1 })
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
        Pinnacle::Conversation.from_json(json_object: response.body)
      end
    end

    # Retrieves conversations by page with optional filtering based off provided
    #  parameters.
    #
    # @param brand_id [Integer] The unique identifier of the brand to filter conversations.
    # @param campaign_id [Integer] The unique identifier of the campaign to filter conversations.
    # @param campaign_type [Pinnacle::CampaignEnum]
    # @param page_index [Integer] Zero-based index for pagination.
    # @param page_size [Integer] Number of conversations to return per page.
    # @param receiver [String] Receiver's phone number in E.164 format.
    # @param sender [String]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::ConversationList]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.list(
    #    brand_id: 101,
    #    campaign_id: 136,
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
        Pinnacle::ConversationList.from_json(json_object: response.body)
      end
    end

    # Update the notes associated with a specific conversation.
    #
    # @param id [Integer] The unique identifier of the conversation to update.
    # @param notes [String] New notes or comments for the conversation.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::SuccessfulConversationUpdate]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.conversations.update(id: 123, notes: "Follow-up completed. Customer satisfied with resolution.")
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
        Pinnacle::SuccessfulConversationUpdate.from_json(json_object: response.body)
      end
    end
  end
end
