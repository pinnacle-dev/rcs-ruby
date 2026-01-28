# frozen_string_literal: true

module Rcs
  module Campaigns
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Rcs::Dlc::Client]
      def dlc
        @dlc ||= Rcs::Campaigns::Dlc::Client.new(client: @client)
      end

      # @return [Rcs::TollFree::Client]
      def toll_free
        @toll_free ||= Rcs::Campaigns::TollFree::Client.new(client: @client)
      end

      # @return [Rcs::Rcs::Client]
      def rcs
        @rcs ||= Rcs::Campaigns::Rcs::Client.new(client: @client)
      end
    end
  end
end
