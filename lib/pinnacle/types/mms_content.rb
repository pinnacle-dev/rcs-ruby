# frozen_string_literal: true

module Pinnacle
  module Types
    # Message with text and/or media files from a phone number.
    class MmsContent < Internal::Types::Model
      field :media_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "mediaUrls"
      field :text, -> { String }, optional: true, nullable: false
    end
  end
end
