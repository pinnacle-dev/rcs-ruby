# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class ShareLocation
    # @return [String] The title for the share location action. Maximum length is 25 characters.
    attr_reader :title
    # @return [String] The type of action being sent
    attr_reader :action_type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title for the share location action. Maximum length is 25 characters.
    # @param action_type [String] The type of action being sent
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::ShareLocation]
    def initialize(title:, action_type:, additional_properties: nil)
      @title = title
      @action_type = action_type
      @additional_properties = additional_properties
      @_field_set = { "title": title, "action_type": action_type }
    end

    # Deserialize a JSON object to an instance of ShareLocation
    #
    # @param json_object [String]
    # @return [Pinnacle::ShareLocation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      action_type = parsed_json["action_type"]
      new(
        title: title,
        action_type: action_type,
        additional_properties: struct
      )
    end

    # Serialize an instance of ShareLocation to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.action_type.is_a?(String) != false || raise("Passed value for field obj.action_type is not the expected type, validation failed.")
    end
  end
end
