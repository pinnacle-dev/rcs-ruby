# frozen_string_literal: true

module Rcs
  module Types
    class UploadResults < Internal::Types::Model
      field :upload_url, -> { String }, optional: false, nullable: false, api_name: "uploadUrl"
      field :download_url, -> { String }, optional: false, nullable: false, api_name: "downloadUrl"
      field :metadata, -> { Rcs::Types::PinnacleFileUploadMetadata }, optional: false, nullable: false
    end
  end
end
