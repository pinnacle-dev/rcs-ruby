# frozen_string_literal: true

require_relative "file_upload_schema_options_download"
require "ostruct"
require "json"

module Pinnacle
  module Tools
    module File
      module Types
        # Additional configurations for your file.
        class FileUploadSchemaOptions
          # @return [Pinnacle::Tools::File::Types::FileUploadSchemaOptionsDownload] Configure download settings for your uploaded file.
          attr_reader :download
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param download [Pinnacle::Tools::File::Types::FileUploadSchemaOptionsDownload] Configure download settings for your uploaded file.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Tools::File::Types::FileUploadSchemaOptions]
          def initialize(download: OMIT, additional_properties: nil)
            @download = download if download != OMIT
            @additional_properties = additional_properties
            @_field_set = { "download": download }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of FileUploadSchemaOptions
          #
          # @param json_object [String]
          # @return [Pinnacle::Tools::File::Types::FileUploadSchemaOptions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["download"].nil?
              download = nil
            else
              download = parsed_json["download"].to_json
              download = Pinnacle::Tools::File::Types::FileUploadSchemaOptionsDownload.from_json(json_object: download)
            end
            new(download: download, additional_properties: struct)
          end

          # Serialize an instance of FileUploadSchemaOptions to a JSON object
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
            obj.download.nil? || Pinnacle::Tools::File::Types::FileUploadSchemaOptionsDownload.validate_raw(obj: obj.download)
          end
        end
      end
    end
  end
end
