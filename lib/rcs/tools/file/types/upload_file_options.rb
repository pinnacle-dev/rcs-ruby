# frozen_string_literal: true

module Rcs
  module Tools
    module File
      module Types
        # Additional configurations for your file.
        class UploadFileOptions < Internal::Types::Model
          field :delete_at, -> { String }, optional: true, nullable: false, api_name: "deleteAt"
          field :download, -> { Rcs::Tools::File::Types::DownloadOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
