# frozen_string_literal: true

require_relative "../../requests"
require_relative "dlc/client"
require_relative "toll_free/client"
require_relative "rcs/client"

module Pinnacle
  module Campaigns
    class Client
      # @return [Pinnacle::Campaigns::DlcClient]
      attr_reader :dlc
      # @return [Pinnacle::Campaigns::TollFreeClient]
      attr_reader :toll_free
      # @return [Pinnacle::Campaigns::RcsClient]
      attr_reader :rcs

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Campaigns::Client]
      def initialize(request_client:)
        @dlc = Pinnacle::Campaigns::DlcClient.new(request_client: request_client)
        @toll_free = Pinnacle::Campaigns::TollFreeClient.new(request_client: request_client)
        @rcs = Pinnacle::Campaigns::RcsClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Pinnacle::Campaigns::AsyncDlcClient]
      attr_reader :dlc
      # @return [Pinnacle::Campaigns::AsyncTollFreeClient]
      attr_reader :toll_free
      # @return [Pinnacle::Campaigns::AsyncRcsClient]
      attr_reader :rcs

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Campaigns::AsyncClient]
      def initialize(request_client:)
        @dlc = Pinnacle::Campaigns::AsyncDlcClient.new(request_client: request_client)
        @toll_free = Pinnacle::Campaigns::AsyncTollFreeClient.new(request_client: request_client)
        @rcs = Pinnacle::Campaigns::AsyncRcsClient.new(request_client: request_client)
      end
    end
  end
end
