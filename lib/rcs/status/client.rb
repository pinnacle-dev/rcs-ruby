# frozen_string_literal: true

require_relative "../../requests"
require_relative "get/client"

module Pinnacle
  module Status
    class Client
      # @return [Pinnacle::Status::GetClient]
      attr_reader :get

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Status::Client]
      def initialize(request_client:)
        @get = Pinnacle::Status::GetClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Pinnacle::Status::AsyncGetClient]
      attr_reader :get

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Status::AsyncClient]
      def initialize(request_client:)
        @get = Pinnacle::Status::AsyncGetClient.new(request_client: request_client)
      end
    end
  end
end
