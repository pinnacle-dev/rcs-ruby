# frozen_string_literal: true

require_relative "v_card_data_file_metadata"
require "ostruct"
require "json"

module Pinnacle
  # File associated to the contact.
  class VCardDataFile
    # @return [String] Presigned URL to download the contact card.
    attr_reader :url
    # @return [Pinnacle::VCardDataFileMetadata] Additional information about the download URL.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param url [String] Presigned URL to download the contact card.
    # @param metadata [Pinnacle::VCardDataFileMetadata] Additional information about the download URL.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::VCardDataFile]
    def initialize(url:, metadata:, additional_properties: nil)
      @url = url
      @metadata = metadata
      @additional_properties = additional_properties
      @_field_set = { "url": url, "metadata": metadata }
    end

    # Deserialize a JSON object to an instance of VCardDataFile
    #
    # @param json_object [String]
    # @return [Pinnacle::VCardDataFile]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      url = parsed_json["url"]
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Pinnacle::VCardDataFileMetadata.from_json(json_object: metadata)
      end
      new(
        url: url,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of VCardDataFile to a JSON object
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
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      Pinnacle::VCardDataFileMetadata.validate_raw(obj: obj.metadata)
    end
  end
end
