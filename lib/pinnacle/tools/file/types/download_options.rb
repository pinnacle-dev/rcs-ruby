# frozen_string_literal: true

module Pinnacle
  module Tools
    module File
      module Types
        # Configure download settings for your uploaded file.
        class DownloadOptions < Internal::Types::Model
          field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
        end
      end
    end
  end
end
