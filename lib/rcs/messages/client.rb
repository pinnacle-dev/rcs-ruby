# frozen_string_literal: true

module Rcs
  module Messages
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
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
      # @return [Rcs::Types::Message]
      def get(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "messages/#{params[:id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::Message.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Add or remove an emoji reaction to a previously sent message.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Messages::Types::ReactMessageParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::Types::ReactionResult]
      def react(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[message_id options reaction]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "messages/react",
          body: Rcs::Messages::Types::ReactMessageParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::ReactionResult.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Rcs::Sms::Client]
      def sms
        @sms ||= Rcs::Messages::Sms::Client.new(client: @client)
      end

      # @return [Rcs::Mms::Client]
      def mms
        @mms ||= Rcs::Messages::Mms::Client.new(client: @client)
      end

      # @return [Rcs::Rcs::Client]
      def rcs
        @rcs ||= Rcs::Messages::Rcs::Client.new(client: @client)
      end

      # @return [Rcs::Blast::Client]
      def blast
        @blast ||= Rcs::Messages::Blast::Client.new(client: @client)
      end

      # @return [Rcs::Schedule::Client]
      def schedule
        @schedule ||= Rcs::Messages::Schedule::Client.new(client: @client)
      end
    end
  end
end
