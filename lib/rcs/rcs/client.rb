# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/rcs_capabilities_result"
require "json"
require_relative "../types/rcs_whitelist_response"
require_relative "../types/rcs_link_result"
require "async"

module Pinnacle
  class RcsClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::RcsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Check RCS capabilities for one or more phone numbers.
    #  This endpoint allows you to verify which RCS features (cards, buttons, etc.) are
    #  supported
    #  on specific phone numbers before sending RCS messages to them.
    #
    # @param phone_numbers [Array<String>] List of phone numbers to check RCS capabilities for (E.164 format)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::RCS_CAPABILITIES_RESULT]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.rcs.get_capabilities(phone_numbers: ["+12345678901", "+19876543210"])
    def get_capabilities(phone_numbers:, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), phoneNumbers: phone_numbers }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/rcs/capabilities"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.transform_values do |value|
        value = value.to_json
        Pinnacle::Types::RcsCapability.from_json(json_object: value)
      end
    end

    # Whitelist a phone number for testing with your test RCS agent.
    #  ## Overview
    #  During development and testing, RCS agents can only send messages to whitelisted
    #  phone numbers.
    #  Use this endpoint to whitelist specific phone numbers to send and receive
    #  messages from the test agent.
    #  ## Verification Process
    #  After whitelisting a number, you'll need to complete verification:
    #  1. Check the test device for message from "RBM Tester Management"
    #  2. Click the "Make me a tester" button
    #  3. Enter the separate 4-digit verification SMS code in the Pinnacle dashboard
    #  at:
    #  ```
    #  .pinnacle.sh/dashboard/brands/{brandId}?campaignId={campaignId}&campaignType=RCS
    #  ```
    #  > **⚠️ Important: Re-whitelisting Numbers**
    #  >
    #  > If you whitelist a number that's already whitelisted, you'll receive a new
    #  message from "RBM Tester Management". **You must click the "Make me a tester"
    #  button again to continue sending and receiving messages.**
    #  > **Important Notes**
    #  >
    #  > - **Verification required:** Messages cannot be sent nor received until you
    #  have clicked the "Make me a tester" button on the test device.
    #  > - **Testing only:** This is only required for test agents. Production agents
    #  can message any RCS-enabled number.
    #  > - **Network limitations:** Whitelisting may be temporarily unavailable for
    #  some carriers but are usually restored shortly.
    #
    # @param agent_id [String] The RCS agent ID (must be prefixed with 'agent_')
    # @param phone_number [String] Phone number to whitelist for testing (E.164 format)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::RcsWhitelistResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.rcs.whitelist(agent_id: "agent_XXXXXXXXXXXX", phone_number: "+12345678901")
    def whitelist(agent_id:, phone_number:, request_options: nil)
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
          agentId: agent_id,
          phoneNumber: phone_number
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/rcs/whitelist"
      end
      Pinnacle::Types::RcsWhitelistResponse.from_json(json_object: response.body)
    end

    # Generate a link for initiating an RCS conversation with your agent.
    #  Users can click these links to start conversations with your RCS agent directly
    #  from websites, emails, or other applications.
    #
    # @param agent_id [String] The RCS agent ID (must be prefixed with 'agent_')
    # @param test_mode [Boolean] Link to the test agent or the production agent if false
    # @param phone_number [String] Fallback phone number (E.164 format) to use if the phone number does not support
    #  RCS. If not provided, no url will be generated.
    # @param body [String] Optional message body to pre-fill after the user clicks the link
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::RcsLinkResult]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.rcs.get_link(
    #    agent_id: "agent_XXXXXXXXXXXX",
    #    test_mode: false,
    #    phone_number: "+12345678901",
    #    body: "Hello, I need help with my order"
    #  )
    def get_link(agent_id:, test_mode: nil, phone_number: nil, body: nil, request_options: nil)
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
          agentId: agent_id,
          testMode: test_mode,
          phoneNumber: phone_number,
          body: body
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/rcs/link"
      end
      Pinnacle::Types::RcsLinkResult.from_json(json_object: response.body)
    end
  end

  class AsyncRcsClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncRcsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Check RCS capabilities for one or more phone numbers.
    #  This endpoint allows you to verify which RCS features (cards, buttons, etc.) are
    #  supported
    #  on specific phone numbers before sending RCS messages to them.
    #
    # @param phone_numbers [Array<String>] List of phone numbers to check RCS capabilities for (E.164 format)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::RCS_CAPABILITIES_RESULT]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.rcs.get_capabilities(phone_numbers: ["+12345678901", "+19876543210"])
    def get_capabilities(phone_numbers:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), phoneNumbers: phone_numbers }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/rcs/capabilities"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.transform_values do |value|
          value = value.to_json
          Pinnacle::Types::RcsCapability.from_json(json_object: value)
        end
      end
    end

    # Whitelist a phone number for testing with your test RCS agent.
    #  ## Overview
    #  During development and testing, RCS agents can only send messages to whitelisted
    #  phone numbers.
    #  Use this endpoint to whitelist specific phone numbers to send and receive
    #  messages from the test agent.
    #  ## Verification Process
    #  After whitelisting a number, you'll need to complete verification:
    #  1. Check the test device for message from "RBM Tester Management"
    #  2. Click the "Make me a tester" button
    #  3. Enter the separate 4-digit verification SMS code in the Pinnacle dashboard
    #  at:
    #  ```
    #  .pinnacle.sh/dashboard/brands/{brandId}?campaignId={campaignId}&campaignType=RCS
    #  ```
    #  > **⚠️ Important: Re-whitelisting Numbers**
    #  >
    #  > If you whitelist a number that's already whitelisted, you'll receive a new
    #  message from "RBM Tester Management". **You must click the "Make me a tester"
    #  button again to continue sending and receiving messages.**
    #  > **Important Notes**
    #  >
    #  > - **Verification required:** Messages cannot be sent nor received until you
    #  have clicked the "Make me a tester" button on the test device.
    #  > - **Testing only:** This is only required for test agents. Production agents
    #  can message any RCS-enabled number.
    #  > - **Network limitations:** Whitelisting may be temporarily unavailable for
    #  some carriers but are usually restored shortly.
    #
    # @param agent_id [String] The RCS agent ID (must be prefixed with 'agent_')
    # @param phone_number [String] Phone number to whitelist for testing (E.164 format)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::RcsWhitelistResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.rcs.whitelist(agent_id: "agent_XXXXXXXXXXXX", phone_number: "+12345678901")
    def whitelist(agent_id:, phone_number:, request_options: nil)
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
            agentId: agent_id,
            phoneNumber: phone_number
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/rcs/whitelist"
        end
        Pinnacle::Types::RcsWhitelistResponse.from_json(json_object: response.body)
      end
    end

    # Generate a link for initiating an RCS conversation with your agent.
    #  Users can click these links to start conversations with your RCS agent directly
    #  from websites, emails, or other applications.
    #
    # @param agent_id [String] The RCS agent ID (must be prefixed with 'agent_')
    # @param test_mode [Boolean] Link to the test agent or the production agent if false
    # @param phone_number [String] Fallback phone number (E.164 format) to use if the phone number does not support
    #  RCS. If not provided, no url will be generated.
    # @param body [String] Optional message body to pre-fill after the user clicks the link
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::RcsLinkResult]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.rcs.get_link(
    #    agent_id: "agent_XXXXXXXXXXXX",
    #    test_mode: false,
    #    phone_number: "+12345678901",
    #    body: "Hello, I need help with my order"
    #  )
    def get_link(agent_id:, test_mode: nil, phone_number: nil, body: nil, request_options: nil)
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
            agentId: agent_id,
            testMode: test_mode,
            phoneNumber: phone_number,
            body: body
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/rcs/link"
        end
        Pinnacle::Types::RcsLinkResult.from_json(json_object: response.body)
      end
    end
  end
end
