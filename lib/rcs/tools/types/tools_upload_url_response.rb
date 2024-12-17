# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Tools
    class ToolsUploadUrlResponse
      # @return [String] The URL to upload the file.
      attr_reader :upload
      # @return [String] The URL to download the file.
      attr_reader :download
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param upload [String] The URL to upload the file.
      # @param download [String] The URL to download the file.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Tools::ToolsUploadUrlResponse]
      def initialize(upload: OMIT, download: OMIT, additional_properties: nil)
        @upload = upload if upload != OMIT
        @download = download if download != OMIT
        @additional_properties = additional_properties
        @_field_set = { "upload": upload, "download": download }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ToolsUploadUrlResponse
      #
      # @param json_object [String]
      # @return [Pinnacle::Tools::ToolsUploadUrlResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        upload = parsed_json["upload"]
        download = parsed_json["download"]
        new(
          upload: upload,
          download: download,
          additional_properties: struct
        )
      end

      # Serialize an instance of ToolsUploadUrlResponse to a JSON object
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
        obj.upload&.is_a?(String) != false || raise("Passed value for field obj.upload is not the expected type, validation failed.")
        obj.download&.is_a?(String) != false || raise("Passed value for field obj.download is not the expected type, validation failed.")
      end
    end
  end
end
