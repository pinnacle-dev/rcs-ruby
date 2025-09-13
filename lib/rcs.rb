# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "rcs/brands/client"
require_relative "rcs/contacts/client"
require_relative "rcs/conversations/client"
require_relative "rcs/messages/client"
require_relative "rcs/phone_numbers/client"
require_relative "rcs/webhooks/client"
require_relative "rcs/campaigns/client"
require_relative "rcs/status/client"
require_relative "rcs/tools/client"

module Pinnacle
  class Client
    # @return [Pinnacle::BrandsClient]
    attr_reader :brands
    # @return [Pinnacle::ContactsClient]
    attr_reader :contacts
    # @return [Pinnacle::ConversationsClient]
    attr_reader :conversations
    # @return [Pinnacle::MessagesClient]
    attr_reader :messages
    # @return [Pinnacle::PhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Pinnacle::WebhooksClient]
    attr_reader :webhooks
    # @return [Pinnacle::Campaigns::Client]
    attr_reader :campaigns
    # @return [Pinnacle::Status::Client]
    attr_reader :status
    # @return [Pinnacle::Tools::Client]
    attr_reader :tools

    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Pinnacle::Client]
    def initialize(api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = Pinnacle::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @brands = Pinnacle::BrandsClient.new(request_client: @request_client)
      @contacts = Pinnacle::ContactsClient.new(request_client: @request_client)
      @conversations = Pinnacle::ConversationsClient.new(request_client: @request_client)
      @messages = Pinnacle::MessagesClient.new(request_client: @request_client)
      @phone_numbers = Pinnacle::PhoneNumbersClient.new(request_client: @request_client)
      @webhooks = Pinnacle::WebhooksClient.new(request_client: @request_client)
      @campaigns = Pinnacle::Campaigns::Client.new(request_client: @request_client)
      @status = Pinnacle::Status::Client.new(request_client: @request_client)
      @tools = Pinnacle::Tools::Client.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [Pinnacle::AsyncBrandsClient]
    attr_reader :brands
    # @return [Pinnacle::AsyncContactsClient]
    attr_reader :contacts
    # @return [Pinnacle::AsyncConversationsClient]
    attr_reader :conversations
    # @return [Pinnacle::AsyncMessagesClient]
    attr_reader :messages
    # @return [Pinnacle::AsyncPhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Pinnacle::AsyncWebhooksClient]
    attr_reader :webhooks
    # @return [Pinnacle::Campaigns::AsyncClient]
    attr_reader :campaigns
    # @return [Pinnacle::Status::AsyncClient]
    attr_reader :status
    # @return [Pinnacle::Tools::AsyncClient]
    attr_reader :tools

    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Pinnacle::AsyncClient]
    def initialize(api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = Pinnacle::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @brands = Pinnacle::AsyncBrandsClient.new(request_client: @async_request_client)
      @contacts = Pinnacle::AsyncContactsClient.new(request_client: @async_request_client)
      @conversations = Pinnacle::AsyncConversationsClient.new(request_client: @async_request_client)
      @messages = Pinnacle::AsyncMessagesClient.new(request_client: @async_request_client)
      @phone_numbers = Pinnacle::AsyncPhoneNumbersClient.new(request_client: @async_request_client)
      @webhooks = Pinnacle::AsyncWebhooksClient.new(request_client: @async_request_client)
      @campaigns = Pinnacle::Campaigns::AsyncClient.new(request_client: @async_request_client)
      @status = Pinnacle::Status::AsyncClient.new(request_client: @async_request_client)
      @tools = Pinnacle::Tools::AsyncClient.new(request_client: @async_request_client)
    end
  end
end
