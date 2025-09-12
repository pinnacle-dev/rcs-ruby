# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class PinnacleUrlConfig
    # @return [String] Destination URL that your shortened link redirects to.
    attr_reader :to
    # @return [String] Expiration date for your shortened link in ISO 8601 format, or null if it's
    #  permanent.
    attr_reader :expires_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param to [String] Destination URL that your shortened link redirects to.
    # @param expires_at [String] Expiration date for your shortened link in ISO 8601 format, or null if it's
    #  permanent.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PinnacleUrlConfig]
    def initialize(to:, expires_at: OMIT, additional_properties: nil)
      @to = to
      @expires_at = expires_at if expires_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "to": to, "expiresAt": expires_at }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PinnacleUrlConfig
    #
    # @param json_object [String]
    # @return [Pinnacle::PinnacleUrlConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      to = parsed_json["to"]
      expires_at = parsed_json["expiresAt"]
      new(
        to: to,
        expires_at: expires_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of PinnacleUrlConfig to a JSON object
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
      obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
    end
  end
end
