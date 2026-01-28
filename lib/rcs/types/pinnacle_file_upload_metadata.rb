# frozen_string_literal: true

module Rcs
  module Types
    class PinnacleFileUploadMetadata < Internal::Types::Model
      field :file_name, -> { String }, optional: false, nullable: false, api_name: "fileName"
      field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"
      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"
      field :delete_at, -> { String }, optional: true, nullable: false, api_name: "deleteAt"
    end
  end
end
