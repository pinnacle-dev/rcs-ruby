# frozen_string_literal: true

module Pinnacle
  module Types
    class RecordingDownload < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false
    end
  end
end
