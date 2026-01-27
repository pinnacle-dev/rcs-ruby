# frozen_string_literal: true

module Rcs
  module Status
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Rcs::Get::Client]
      def get
        @get ||= Rcs::Status::Get::Client.new(client: @client)
      end
    end
  end
end
