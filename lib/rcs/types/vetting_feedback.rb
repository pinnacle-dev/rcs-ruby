# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class VettingFeedback
    # @return [String] Detailed description of the feedback.
    attr_reader :description
    # @return [String] Human-readable name of the feedback item.
    attr_reader :display_name
    # @return [Array<String>] Fields affected by this feedback item.
    attr_reader :fields
    # @return [String] Feedback item identifier.
    attr_reader :id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] Detailed description of the feedback.
    # @param display_name [String] Human-readable name of the feedback item.
    # @param fields [Array<String>] Fields affected by this feedback item.
    # @param id [String] Feedback item identifier.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::VettingFeedback]
    def initialize(description:, display_name:, fields:, id:, additional_properties: nil)
      @description = description
      @display_name = display_name
      @fields = fields
      @id = id
      @additional_properties = additional_properties
      @_field_set = { "description": description, "displayName": display_name, "fields": fields, "id": id }
    end

    # Deserialize a JSON object to an instance of VettingFeedback
    #
    # @param json_object [String]
    # @return [Pinnacle::VettingFeedback]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      display_name = parsed_json["displayName"]
      fields = parsed_json["fields"]
      id = parsed_json["id"]
      new(
        description: description,
        display_name: display_name,
        fields: fields,
        id: id,
        additional_properties: struct
      )
    end

    # Serialize an instance of VettingFeedback to a JSON object
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
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.display_name.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.fields.is_a?(Array) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
    end
  end
end
