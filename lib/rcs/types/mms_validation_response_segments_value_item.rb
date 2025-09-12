# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class MmsValidationResponseSegmentsValueItem
    # @return [Array<String>] Media file URLs that would be included in this segment.
    attr_reader :files
    # @return [Integer] Size of this segment in bytes.
    attr_reader :size
    # @return [String] Text content in this segment.
    attr_reader :text
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param files [Array<String>] Media file URLs that would be included in this segment.
    # @param size [Integer] Size of this segment in bytes.
    # @param text [String] Text content in this segment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MmsValidationResponseSegmentsValueItem]
    def initialize(files:, size:, text:, additional_properties: nil)
      @files = files
      @size = size
      @text = text
      @additional_properties = additional_properties
      @_field_set = { "files": files, "size": size, "text": text }
    end

    # Deserialize a JSON object to an instance of
    #  MmsValidationResponseSegmentsValueItem
    #
    # @param json_object [String]
    # @return [Pinnacle::MmsValidationResponseSegmentsValueItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      files = parsed_json["files"]
      size = parsed_json["size"]
      text = parsed_json["text"]
      new(
        files: files,
        size: size,
        text: text,
        additional_properties: struct
      )
    end

    # Serialize an instance of MmsValidationResponseSegmentsValueItem to a JSON object
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
      obj.files.is_a?(Array) != false || raise("Passed value for field obj.files is not the expected type, validation failed.")
      obj.size.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end
