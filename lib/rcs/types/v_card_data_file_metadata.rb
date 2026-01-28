# frozen_string_literal: true

module Rcs
  module Types
    # Additional information about the download URL.
    class VCardDataFileMetadata < Internal::Types::Model
      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"
    end
  end
end
