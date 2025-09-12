# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class EnhancedContactItem
    # @return [String] Professional or personal description of the contact.
    #  May include job title, company affiliation, or biographical information.
    attr_reader :description
    # @return [String] Primary email address associated with this contact profile.
    attr_reader :email
    # @return [Array<String>] Additional web links associated with this contact profile.
    #  May include personal websites, social media profiles, or professional
    #  portfolios.
    attr_reader :links
    # @return [String] LinkedIn profile URL if available and publicly accessible.
    #  Null if no LinkedIn profile is found or accessible.
    attr_reader :linkedin
    # @return [String] Full name of the contact person associated with this profile.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] Professional or personal description of the contact.
    #  May include job title, company affiliation, or biographical information.
    # @param email [String] Primary email address associated with this contact profile.
    # @param links [Array<String>] Additional web links associated with this contact profile.
    #  May include personal websites, social media profiles, or professional
    #  portfolios.
    # @param linkedin [String] LinkedIn profile URL if available and publicly accessible.
    #  Null if no LinkedIn profile is found or accessible.
    # @param name [String] Full name of the contact person associated with this profile.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::EnhancedContactItem]
    def initialize(description:, email:, links:, name:, linkedin: OMIT, additional_properties: nil)
      @description = description
      @email = email
      @links = links
      @linkedin = linkedin if linkedin != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = {
        "description": description,
        "email": email,
        "links": links,
        "linkedin": linkedin,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EnhancedContactItem
    #
    # @param json_object [String]
    # @return [Pinnacle::EnhancedContactItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      email = parsed_json["email"]
      links = parsed_json["links"]
      linkedin = parsed_json["linkedin"]
      name = parsed_json["name"]
      new(
        description: description,
        email: email,
        links: links,
        linkedin: linkedin,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of EnhancedContactItem to a JSON object
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
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.links.is_a?(Array) != false || raise("Passed value for field obj.links is not the expected type, validation failed.")
      obj.linkedin&.is_a?(String) != false || raise("Passed value for field obj.linkedin is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
