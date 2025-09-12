# frozen_string_literal: true

require_relative "pinnacle_file_upload_metadata"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class UploadResults
      # @return [String] Presigned URL for uploading your file to storage.
      attr_reader :upload_url
      # @return [String] Presigned URL for downloading your file.
      attr_reader :download_url
      # @return [Pinnacle::Types::PinnacleFileUploadMetadata]
      attr_reader :metadata
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param upload_url [String] Presigned URL for uploading your file to storage.
      # @param download_url [String] Presigned URL for downloading your file.
      # @param metadata [Pinnacle::Types::PinnacleFileUploadMetadata]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::UploadResults]
      def initialize(upload_url:, download_url:, metadata:, additional_properties: nil)
        @upload_url = upload_url
        @download_url = download_url
        @metadata = metadata
        @additional_properties = additional_properties
        @_field_set = { "uploadUrl": upload_url, "downloadUrl": download_url, "metadata": metadata }
      end

      # Deserialize a JSON object to an instance of UploadResults
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::UploadResults]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        upload_url = parsed_json["uploadUrl"]
        download_url = parsed_json["downloadUrl"]
        if parsed_json["metadata"].nil?
          metadata = nil
        else
          metadata = parsed_json["metadata"].to_json
          metadata = Pinnacle::Types::PinnacleFileUploadMetadata.from_json(json_object: metadata)
        end
        new(
          upload_url: upload_url,
          download_url: download_url,
          metadata: metadata,
          additional_properties: struct
        )
      end

      # Serialize an instance of UploadResults to a JSON object
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
        obj.upload_url.is_a?(String) != false || raise("Passed value for field obj.upload_url is not the expected type, validation failed.")
        obj.download_url.is_a?(String) != false || raise("Passed value for field obj.download_url is not the expected type, validation failed.")
        Pinnacle::Types::PinnacleFileUploadMetadata.validate_raw(obj: obj.metadata)
      end
    end
  end
end
