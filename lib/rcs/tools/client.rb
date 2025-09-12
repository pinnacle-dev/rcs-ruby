# frozen_string_literal: true

require_relative "../../requests"
require_relative "url/client"
require_relative "file/client"
require_relative "contact_card/client"

module Pinnacle
  module Tools
    class Client
      # @return [Pinnacle::Tools::UrlClient]
      attr_reader :url
      # @return [Pinnacle::Tools::FileClient]
      attr_reader :file
      # @return [Pinnacle::Tools::ContactCardClient]
      attr_reader :contact_card

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Tools::Client]
      def initialize(request_client:)
        @url = Pinnacle::Tools::UrlClient.new(request_client: request_client)
        @file = Pinnacle::Tools::FileClient.new(request_client: request_client)
        @contact_card = Pinnacle::Tools::ContactCardClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Pinnacle::Tools::AsyncUrlClient]
      attr_reader :url
      # @return [Pinnacle::Tools::AsyncFileClient]
      attr_reader :file
      # @return [Pinnacle::Tools::AsyncContactCardClient]
      attr_reader :contact_card

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Tools::AsyncClient]
      def initialize(request_client:)
        @url = Pinnacle::Tools::AsyncUrlClient.new(request_client: request_client)
        @file = Pinnacle::Tools::AsyncFileClient.new(request_client: request_client)
        @contact_card = Pinnacle::Tools::AsyncContactCardClient.new(request_client: request_client)
      end
    end
  end
end
