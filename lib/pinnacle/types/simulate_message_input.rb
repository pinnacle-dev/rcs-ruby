# frozen_string_literal: true

module Pinnacle
  module Types
    # User message payload. At least one of `text` or `mediaUrls` must be non-empty.
    # Send only `text` to simulate an inbound SMS; include `mediaUrls` to simulate an inbound MMS.
    class SimulateMessageInput < Internal::Types::Model
      field :text, -> { String }, optional: true, nullable: false
      field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"
    end
  end
end
