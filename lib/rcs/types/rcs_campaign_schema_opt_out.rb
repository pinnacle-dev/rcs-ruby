# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Opt-out configuration.
  class RcsCampaignSchemaOptOut
    # @return [String] Description for the keyword.
    attr_reader :description
    # @return [Array<String>] Keywords to opt-out.
    attr_reader :keywords
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] Description for the keyword.
    # @param keywords [Array<String>] Keywords to opt-out.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsCampaignSchemaOptOut]
    def initialize(description: OMIT, keywords: OMIT, additional_properties: nil)
      @description = description if description != OMIT
      @keywords = keywords if keywords != OMIT
      @additional_properties = additional_properties
      @_field_set = { "description": description, "keywords": keywords }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RcsCampaignSchemaOptOut
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsCampaignSchemaOptOut]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      keywords = parsed_json["keywords"]
      new(
        description: description,
        keywords: keywords,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsCampaignSchemaOptOut to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
    end
  end
end
