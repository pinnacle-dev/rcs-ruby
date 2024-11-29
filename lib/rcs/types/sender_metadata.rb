# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class SenderMetadata
    # @return [String]
    attr_reader :city
    # @return [String]
    attr_reader :state
    # @return [String]
    attr_reader :country
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param city [String]
    # @param state [String]
    # @param country [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SenderMetadata]
    def initialize(city: OMIT, state: OMIT, country: OMIT, additional_properties: nil)
      @city = city if city != OMIT
      @state = state if state != OMIT
      @country = country if country != OMIT
      @additional_properties = additional_properties
      @_field_set = { "city": city, "state": state, "country": country }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SenderMetadata
    #
    # @param json_object [String]
    # @return [Pinnacle::SenderMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      city = parsed_json["city"]
      state = parsed_json["state"]
      country = parsed_json["country"]
      new(
        city: city,
        state: state,
        country: country,
        additional_properties: struct
      )
    end

    # Serialize an instance of SenderMetadata to a JSON object
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
      obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.country&.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
    end
  end
end
