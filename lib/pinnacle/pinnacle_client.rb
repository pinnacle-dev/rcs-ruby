# frozen_string_literal: true

require_relative "wrapper/messages/client"
require_relative "wrapper/tools/file_uploader"
require_relative "wrapper/tools/client"

module Pinnacle
  # Reopen the Client class to add custom methods for webhook processing and file uploads.
  class Client
    # Returns an enhanced messages client with webhook processing support.
    #
    # @return [Pinnacle::Wrapper::Messages::Client]
    def messages
      @messages ||= Pinnacle::Wrapper::Messages::Client.new(client: @raw_client)
    end

    # Returns an enhanced tools client with file upload helper.
    #
    # @return [Pinnacle::Wrapper::Tools::Client]
    def tools
      @tools ||= Pinnacle::Wrapper::Tools::Client.new(client: @raw_client)
    end
  end
end
