# frozen_string_literal: true

module Pinnacle
  module Network
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Pinnacle::SimSwap::Client]
      def sim_swap
        @sim_swap ||= Pinnacle::Network::SimSwap::Client.new(client: @client)
      end

      # @return [Pinnacle::SubscriberMatch::Client]
      def subscriber_match
        @subscriber_match ||= Pinnacle::Network::SubscriberMatch::Client.new(client: @client)
      end

      # @return [Pinnacle::SilentAuth::Client]
      def silent_auth
        @silent_auth ||= Pinnacle::Network::SilentAuth::Client.new(client: @client)
      end

      # @return [Pinnacle::Requests::Client]
      def requests
        @requests ||= Pinnacle::Network::Requests::Client.new(client: @client)
      end
    end
  end
end
