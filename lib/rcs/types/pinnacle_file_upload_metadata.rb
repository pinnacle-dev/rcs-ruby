# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class PinnacleFileUploadMetadata
      # @return [String] Name of the uploaded file.
      attr_reader :file_name
      # @return [String] MIME type of the file.
      attr_reader :content_type
      # @return [String] Expiration date in ISO 8601 format for file download access.<br>
      #  Null indicates that `download.expiresAt` was not provided and the expiration
      #  time is defaulted to one hour after uploading.
      attr_reader :expires_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param file_name [String] Name of the uploaded file.
      # @param content_type [String] MIME type of the file.
      # @param expires_at [String] Expiration date in ISO 8601 format for file download access.<br>
      #  Null indicates that `download.expiresAt` was not provided and the expiration
      #  time is defaulted to one hour after uploading.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::PinnacleFileUploadMetadata]
      def initialize(file_name:, content_type:, expires_at: OMIT, additional_properties: nil)
        @file_name = file_name
        @content_type = content_type
        @expires_at = expires_at if expires_at != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "fileName": file_name,
          "contentType": content_type,
          "expiresAt": expires_at
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PinnacleFileUploadMetadata
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::PinnacleFileUploadMetadata]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        file_name = parsed_json["fileName"]
        content_type = parsed_json["contentType"]
        expires_at = parsed_json["expiresAt"]
        new(
          file_name: file_name,
          content_type: content_type,
          expires_at: expires_at,
          additional_properties: struct
        )
      end

      # Serialize an instance of PinnacleFileUploadMetadata to a JSON object
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
        obj.file_name.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.content_type.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
        obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      end
    end
  end
end
