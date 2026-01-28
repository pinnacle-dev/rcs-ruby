# frozen_string_literal: true

module Pinnacle
  module Tools
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Pinnacle::Url::Client]
      def url
        @url ||= Pinnacle::Tools::Url::Client.new(client: @client)
      end

      # @return [Pinnacle::File::Client]
      def file
        @file ||= Pinnacle::Tools::File::Client.new(client: @client)
      end

      # @return [Pinnacle::ContactCard::Client]
      def contact_card
        @contact_card ||= Pinnacle::Tools::ContactCard::Client.new(client: @client)
      end
    end
  end
end
