# frozen_string_literal: true

module Rcs
  module Tools
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Rcs::Url::Client]
      def url
        @url ||= Rcs::Tools::Url::Client.new(client: @client)
      end

      # @return [Rcs::File::Client]
      def file
        @file ||= Rcs::Tools::File::Client.new(client: @client)
      end

      # @return [Rcs::ContactCard::Client]
      def contact_card
        @contact_card ||= Rcs::Tools::ContactCard::Client.new(client: @client)
      end
    end
  end
end
