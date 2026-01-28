# frozen_string_literal: true

module Pinnacle
  module Tools
    module File
      module Types
        class UploadFileParams < Internal::Types::Model
          field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"
          field :size, -> { Integer }, optional: false, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :options, -> { Pinnacle::Tools::File::Types::UploadFileOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
