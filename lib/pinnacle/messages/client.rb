# frozen_string_literal: true

module Pinnacle
  module Messages
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve a previously sent message.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Pinnacle::Types::Message]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "messages/#{params[:id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::Message.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Add or remove an emoji reaction to a previously sent message.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Messages::Types::ReactMessageParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::ReactionResult]
      def react(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "messages/react",
          body: Pinnacle::Messages::Types::ReactMessageParams.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::ReactionResult.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Pinnacle::Sms::Client]
      def sms
        @sms ||= Pinnacle::Messages::Sms::Client.new(client: @client)
      end

      # @return [Pinnacle::Mms::Client]
      def mms
        @mms ||= Pinnacle::Messages::Mms::Client.new(client: @client)
      end

      # @return [Pinnacle::Rcs::Client]
      def rcs
        @rcs ||= Pinnacle::Messages::Rcs::Client.new(client: @client)
      end

      # @return [Pinnacle::Blast::Client]
      def blast
        @blast ||= Pinnacle::Messages::Blast::Client.new(client: @client)
      end

      # @return [Pinnacle::Schedule::Client]
      def schedule
        @schedule ||= Pinnacle::Messages::Schedule::Client.new(client: @client)
      end
    end
  end
end
