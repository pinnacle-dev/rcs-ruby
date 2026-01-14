# frozen_string_literal: true

module Pinnacle
  module Types
    # Metadata about the media file in the message.
    class RcsMediaDetailsContent < Internal::Types::Model
      field :full_path, -> { String }, optional: true, nullable: false, api_name: "fullPath"
      field :mime_type, -> { String }, optional: false, nullable: false, api_name: "mimeType"
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
