# frozen_string_literal: true

require_relative "../../requests"
require_relative "sms/client"

module Pinnacle
  module Message
    class Client
      # @return [Pinnacle::Message::SmsClient]
      attr_reader :sms

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Message::Client]
      def initialize(request_client:)
        @sms = Pinnacle::Message::SmsClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Pinnacle::Message::AsyncSmsClient]
      attr_reader :sms

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Message::AsyncClient]
      def initialize(request_client:)
        @sms = Pinnacle::Message::AsyncSmsClient.new(request_client: request_client)
      end
    end
  end
end
