# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Contact
    # @return [String] Additional information about the contact.
    attr_reader :description
    # @return [String] Contact's email address, if available.
    attr_reader :email
    # @return [Integer] Unique ID of the contact.
    attr_reader :id
    # @return [String] Full name of the contact, if available.
    attr_reader :name
    # @return [String] Contact's phone number in E.164 format.
    attr_reader :phone_number
    # @return [Array<String>] List of tags associated with the contact.
    attr_reader :tags
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] Additional information about the contact.
    # @param email [String] Contact's email address, if available.
    # @param id [Integer] Unique ID of the contact.
    # @param name [String] Full name of the contact, if available.
    # @param phone_number [String] Contact's phone number in E.164 format.
    # @param tags [Array<String>] List of tags associated with the contact.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Contact]
    def initialize(id:, phone_number:, description: OMIT, email: OMIT, name: OMIT, tags: OMIT,
                   additional_properties: nil)
      @description = description if description != OMIT
      @email = email if email != OMIT
      @id = id
      @name = name if name != OMIT
      @phone_number = phone_number
      @tags = tags if tags != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "description": description,
        "email": email,
        "id": id,
        "name": name,
        "phoneNumber": phone_number,
        "tags": tags
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Contact
    #
    # @param json_object [String]
    # @return [Pinnacle::Contact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      email = parsed_json["email"]
      id = parsed_json["id"]
      name = parsed_json["name"]
      phone_number = parsed_json["phoneNumber"]
      tags = parsed_json["tags"]
      new(
        description: description,
        email: email,
        id: id,
        name: name,
        phone_number: phone_number,
        tags: tags,
        additional_properties: struct
      )
    end

    # Serialize an instance of Contact to a JSON object
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
      obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
    end
  end
end
