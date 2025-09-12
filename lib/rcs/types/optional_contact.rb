# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class OptionalContact
    # @return [String] New notes or details for your contact.
    attr_reader :description
    # @return [String] New email address for your contact.
    attr_reader :email
    # @return [String] New name for your contact.
    attr_reader :name
    # @return [Array<String>] New tags for your contact.
    attr_reader :tags
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] New notes or details for your contact.
    # @param email [String] New email address for your contact.
    # @param name [String] New name for your contact.
    # @param tags [Array<String>] New tags for your contact.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::OptionalContact]
    def initialize(description: OMIT, email: OMIT, name: OMIT, tags: OMIT, additional_properties: nil)
      @description = description if description != OMIT
      @email = email if email != OMIT
      @name = name if name != OMIT
      @tags = tags if tags != OMIT
      @additional_properties = additional_properties
      @_field_set = { "description": description, "email": email, "name": name, "tags": tags }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OptionalContact
    #
    # @param json_object [String]
    # @return [Pinnacle::OptionalContact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      email = parsed_json["email"]
      name = parsed_json["name"]
      tags = parsed_json["tags"]
      new(
        description: description,
        email: email,
        name: name,
        tags: tags,
        additional_properties: struct
      )
    end

    # Serialize an instance of OptionalContact to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
    end
  end
end
