# frozen_string_literal: true

require_relative "wrapper/messages/client"
require_relative "wrapper/tools/file_uploader"
require_relative "wrapper/tools/client"

module Rcs
  # Extends the base client to add custom methods for webhook processing and file uploads.
  class Client < PinnacleBaseClient
    # Returns an enhanced messages client with webhook processing support.
    #
    # @return [Rcs::Wrapper::Messages::Client]
    def messages
      @messages ||= Rcs::Wrapper::Messages::Client.new(client: @raw_client)
    end

    # Returns an enhanced tools client with file upload helper.
    #
    # @return [Rcs::Wrapper::Tools::Client]
    def tools
      @tools ||= Rcs::Wrapper::Tools::Client.new(client: @raw_client)
    end
  end
end

# Alias for backwards compatibility - allows users to use Pinnacle::Client
Pinnacle = Rcs
