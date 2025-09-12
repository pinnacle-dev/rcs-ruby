# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Metadata about the media file in the message.
  class RcsMediaDetailsContent
    # @return [String] Path to the file in Pinnacle's storage.
    attr_reader :full_path
    # @return [String] Detected MIME type of the media file.
    attr_reader :mime_type
    # @return [String] Direct URL to the media file.
    attr_reader :url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param full_path [String] Path to the file in Pinnacle's storage.
    # @param mime_type [String] Detected MIME type of the media file.
    # @param url [String] Direct URL to the media file.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsMediaDetailsContent]
    def initialize(mime_type:, url:, full_path: OMIT, additional_properties: nil)
      @full_path = full_path if full_path != OMIT
      @mime_type = mime_type
      @url = url
      @additional_properties = additional_properties
      @_field_set = { "fullPath": full_path, "mimeType": mime_type, "url": url }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RcsMediaDetailsContent
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsMediaDetailsContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      full_path = parsed_json["fullPath"]
      mime_type = parsed_json["mimeType"]
      url = parsed_json["url"]
      new(
        full_path: full_path,
        mime_type: mime_type,
        url: url,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsMediaDetailsContent to a JSON object
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
      obj.full_path&.is_a?(String) != false || raise("Passed value for field obj.full_path is not the expected type, validation failed.")
      obj.mime_type.is_a?(String) != false || raise("Passed value for field obj.mime_type is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end
