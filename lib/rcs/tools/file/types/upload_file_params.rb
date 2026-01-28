# frozen_string_literal: true

module Rcs
  module Tools
    module File
      module Types
        class UploadFileParams < Internal::Types::Model
          field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"
          field :size, -> { Integer }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :options, -> { Rcs::Tools::File::Types::UploadFileOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
