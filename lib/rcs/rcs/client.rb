# frozen_string_literal: true

module Rcs
  module Rcs
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Check RCS capabilities for one or more phone numbers.
      #
      # This endpoint allows you to verify which RCS features (cards, buttons, etc.) are supported
      # on specific phone numbers before sending RCS messages to them.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Rcs::Types::RcsCapabilitiesQuery]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Hash[String, Rcs::Types::RcsCapability, nil]]
      def get_capabilities(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[phone_numbers]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "rcs/capabilities",
          body: Rcs::Rcs::Types::RcsCapabilitiesQuery.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::RcsCapabilitiesResult.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Whitelist a phone number for testing with your test RCS agent.
      #
      # ## Overview
      # During development and testing, RCS agents can only send messages to whitelisted phone numbers.
      # Use this endpoint to whitelist specific phone numbers to send and receive messages from the test agent.
      #
      # ## Verification Process
      # After whitelisting a number, you'll need to complete verification:
      #
      # 1. Check the test device for message from "RBM Tester Management"
      # 2. Click the "Make me a tester" button
      # 3. Enter the separate 4-digit verification SMS code in the Pinnacle dashboard at:
      #    ```
      #    https://app.pinnacle.sh/dashboard/brands/{brandId}?campaignId={campaignId}&campaignType=RCS
      #    ```
      #
      #  > **⚠️ Important: Re-whitelisting Numbers**
      # >
      # > If you whitelist a number that's already whitelisted, you'll receive a new message from "RBM Tester
      # Management". **You must click the "Make me a tester" button again to continue sending and receiving messages.**
      #
      # > **Important Notes**
      # >
      # > - **Verification required:** Messages cannot be sent nor received until you have clicked the "Make me a
      # tester" button on the test device.
      # > - **Testing only:** This is only required for test agents. Production agents can message any RCS-enabled
      # number.
      # > - **Network limitations:** Whitelisting may be temporarily unavailable for some carriers but are usually
      # restored shortly.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Rcs::Types::RcsWhitelistRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::Types::RcsWhitelistResponse]
      def whitelist(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[agent_id phone_number]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "rcs/whitelist",
          body: Rcs::Rcs::Types::RcsWhitelistRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::RcsWhitelistResponse.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Generate a link for initiating an RCS conversation with your agent.
      #
      # Users can click these links to start conversations with your RCS agent directly
      # from websites, emails, or other applications.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Rcs::Types::RcsLinkRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::Types::RcsLinkResult]
      def get_link(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[agent_id test_mode phone_number body]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "rcs/link",
          body: Rcs::Rcs::Types::RcsLinkRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::RcsLinkResult.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
