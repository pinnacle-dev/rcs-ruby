# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # SMS message containing plain text only.
  class SmsContent
    # @return [String] Message content.
    attr_reader :text
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param text [String] Message content.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SmsContent]
    def initialize(text:, additional_properties: nil)
      @text = text
      @additional_properties = additional_properties
      @_field_set = { "text": text }
    end

    # Deserialize a JSON object to an instance of SmsContent
    #
    # @param json_object [String]
    # @return [Pinnacle::SmsContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = parsed_json["text"]
      new(text: text, additional_properties: struct)
    end

    # Serialize an instance of SmsContent to a JSON object
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
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end
