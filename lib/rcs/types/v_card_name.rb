# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Structured name components.
  class VCardName
    # @return [String] Last name or surname.
    attr_reader :family_name
    # @return [String] First name or given name.
    attr_reader :given_name
    # @return [Array<String>] Middle names or additional names.
    attr_reader :additional_names
    # @return [Array<String>] Title prefixes like "Dr.", "Mr.", "Ms.".
    attr_reader :honorific_prefixes
    # @return [Array<String>] Title suffixes like "Jr.", "Sr.", "PhD".
    attr_reader :honorific_suffixes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param family_name [String] Last name or surname.
    # @param given_name [String] First name or given name.
    # @param additional_names [Array<String>] Middle names or additional names.
    # @param honorific_prefixes [Array<String>] Title prefixes like "Dr.", "Mr.", "Ms.".
    # @param honorific_suffixes [Array<String>] Title suffixes like "Jr.", "Sr.", "PhD".
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::VCardName]
    def initialize(family_name: OMIT, given_name: OMIT, additional_names: OMIT, honorific_prefixes: OMIT,
                   honorific_suffixes: OMIT, additional_properties: nil)
      @family_name = family_name if family_name != OMIT
      @given_name = given_name if given_name != OMIT
      @additional_names = additional_names if additional_names != OMIT
      @honorific_prefixes = honorific_prefixes if honorific_prefixes != OMIT
      @honorific_suffixes = honorific_suffixes if honorific_suffixes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "familyName": family_name,
        "givenName": given_name,
        "additionalNames": additional_names,
        "honorificPrefixes": honorific_prefixes,
        "honorificSuffixes": honorific_suffixes
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VCardName
    #
    # @param json_object [String]
    # @return [Pinnacle::VCardName]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      family_name = parsed_json["familyName"]
      given_name = parsed_json["givenName"]
      additional_names = parsed_json["additionalNames"]
      honorific_prefixes = parsed_json["honorificPrefixes"]
      honorific_suffixes = parsed_json["honorificSuffixes"]
      new(
        family_name: family_name,
        given_name: given_name,
        additional_names: additional_names,
        honorific_prefixes: honorific_prefixes,
        honorific_suffixes: honorific_suffixes,
        additional_properties: struct
      )
    end

    # Serialize an instance of VCardName to a JSON object
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
      obj.family_name&.is_a?(String) != false || raise("Passed value for field obj.family_name is not the expected type, validation failed.")
      obj.given_name&.is_a?(String) != false || raise("Passed value for field obj.given_name is not the expected type, validation failed.")
      obj.additional_names&.is_a?(Array) != false || raise("Passed value for field obj.additional_names is not the expected type, validation failed.")
      obj.honorific_prefixes&.is_a?(Array) != false || raise("Passed value for field obj.honorific_prefixes is not the expected type, validation failed.")
      obj.honorific_suffixes&.is_a?(Array) != false || raise("Passed value for field obj.honorific_suffixes is not the expected type, validation failed.")
    end
  end
end
