# frozen_string_literal: true

require_relative "download_options"
require "ostruct"
require "json"

module Pinnacle
  module Tools
    module File
      module Types
        # Additional configurations for your file.
        class UploadFileOptions
          # @return [String] Set a deletion date for your file in ISO 8601 format. After this date, the file
          #  will be automatically deleted from our storage.<br>
          #  If this field is not provided, the file will not be deleted. You can still
          #  schedule deletion or delete the file manually in the Storage page in the
          #  dashboard.
          attr_reader :delete_at
          # @return [Pinnacle::Tools::File::Types::DownloadOptions] Configure download settings for your uploaded file.
          attr_reader :download
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param delete_at [String] Set a deletion date for your file in ISO 8601 format. After this date, the file
          #  will be automatically deleted from our storage.<br>
          #  If this field is not provided, the file will not be deleted. You can still
          #  schedule deletion or delete the file manually in the Storage page in the
          #  dashboard.
          # @param download [Pinnacle::Tools::File::Types::DownloadOptions] Configure download settings for your uploaded file.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Tools::File::Types::UploadFileOptions]
          def initialize(delete_at: OMIT, download: OMIT, additional_properties: nil)
            @delete_at = delete_at if delete_at != OMIT
            @download = download if download != OMIT
            @additional_properties = additional_properties
            @_field_set = { "deleteAt": delete_at, "download": download }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of UploadFileOptions
          #
          # @param json_object [String]
          # @return [Pinnacle::Tools::File::Types::UploadFileOptions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            delete_at = parsed_json["deleteAt"]
            if parsed_json["download"].nil?
              download = nil
            else
              download = parsed_json["download"].to_json
              download = Pinnacle::Tools::File::Types::DownloadOptions.from_json(json_object: download)
            end
            new(
              delete_at: delete_at,
              download: download,
              additional_properties: struct
            )
          end

          # Serialize an instance of UploadFileOptions to a JSON object
          #
          # @return [String]
          def to_json(*_args)
            @_field_set&.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            obj.delete_at&.is_a?(String) != false || raise("Passed value for field obj.delete_at is not the expected type, validation failed.")
            obj.download.nil? || Pinnacle::Tools::File::Types::DownloadOptions.validate_raw(obj: obj.download)
          end
        end
      end
    end
  end
end
