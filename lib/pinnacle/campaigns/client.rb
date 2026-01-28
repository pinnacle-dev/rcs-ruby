# frozen_string_literal: true

module Pinnacle
  module Campaigns
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Pinnacle::Dlc::Client]
      def dlc
        @dlc ||= Pinnacle::Campaigns::Dlc::Client.new(client: @client)
      end

      # @return [Pinnacle::TollFree::Client]
      def toll_free
        @toll_free ||= Pinnacle::Campaigns::TollFree::Client.new(client: @client)
      end

      # @return [Pinnacle::Rcs::Client]
      def rcs
        @rcs ||= Pinnacle::Campaigns::Rcs::Client.new(client: @client)
      end
    end
  end
end
