# frozen_string_literal: true

module Pinnacle
  module Rcs
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve details of an RCS agent by its ID.
      #
      # Returns the agent's configuration including display name, description, logo, hero image,
      # contact information, and other settings.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :agent_id
      #
      # @return [Pinnacle::Types::RcsAgentResponse]
      def get_agent(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "rcs/#{params[:agent_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::RcsAgentResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Check RCS capabilities for one or more phone numbers.
      #
      # This endpoint allows you to verify which RCS features (cards, buttons, etc.) are supported
      # on specific phone numbers before sending RCS messages to them.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Rcs::Types::RcsCapabilitiesQuery]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Hash[String, Pinnacle::Types::RcsCapability, nil]]
      def get_capabilities(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "rcs/capabilities",
          body: Pinnacle::Rcs::Types::RcsCapabilitiesQuery.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::RcsCapabilitiesResult.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Generate a link for initiating an RCS conversation with your agent.
      #
      # Users can click these links to start conversations with your RCS agent directly
      # from websites, emails, or other applications.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Rcs::Types::RcsLinkRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::RcsLinkResult]
      def get_link(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "rcs/link",
          body: Pinnacle::Rcs::Types::RcsLinkRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::RcsLinkResult.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Pinnacle::Agents::Client]
      def agents
        @agents ||= Pinnacle::Rcs::Agents::Client.new(client: @client)
      end

      # @return [Pinnacle::WhitelistedNumbers::Client]
      def whitelisted_numbers
        @whitelisted_numbers ||= Pinnacle::Rcs::WhitelistedNumbers::Client.new(client: @client)
      end

      # @return [Pinnacle::Test::Client]
      def test
        @test ||= Pinnacle::Rcs::Test::Client.new(client: @client)
      end
    end
  end
end
