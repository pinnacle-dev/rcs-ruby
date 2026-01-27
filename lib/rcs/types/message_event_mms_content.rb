# frozen_string_literal: true

module Rcs
  module Types
    # MMS message with text and/or media files from a phone number.
    class MessageEventMmsContent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :media_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "mediaUrls"
      field :text, -> { String }, optional: true, nullable: false
    end
  end
end
