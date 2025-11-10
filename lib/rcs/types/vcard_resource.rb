# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class VcardResource
      # @return [String] The unique identifier of the contact. This identifier is a string that always
      #  begins with the prefix `cc_`, for example: `cc_1234567890`.
      attr_reader :id
      # @return [String] Presigned download url to download vCard data. <br>
      #  This link will expire in one hour.
      attr_reader :download_url
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] The unique identifier of the contact. This identifier is a string that always
      #  begins with the prefix `cc_`, for example: `cc_1234567890`.
      # @param download_url [String] Presigned download url to download vCard data. <br>
      #  This link will expire in one hour.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::VcardResource]
      def initialize(id: OMIT, download_url: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @download_url = download_url if download_url != OMIT
        @additional_properties = additional_properties
        @_field_set = { "id": id, "downloadUrl": download_url }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VcardResource
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::VcardResource]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        download_url = parsed_json["downloadUrl"]
        new(
          id: id,
          download_url: download_url,
          additional_properties: struct
        )
      end

      # Serialize an instance of VcardResource to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.download_url&.is_a?(String) != false || raise("Passed value for field obj.download_url is not the expected type, validation failed.")
      end
    end
  end
end
