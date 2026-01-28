# frozen_string_literal: true

module Pinnacle
  module Status
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Pinnacle::Get::Client]
      def get
        @get ||= Pinnacle::Status::Get::Client.new(client: @client)
      end
    end
  end
end
