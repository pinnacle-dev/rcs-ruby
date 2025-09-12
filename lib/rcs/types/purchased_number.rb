# frozen_string_literal: true

require_relative "buy_response_capabilities"
require "ostruct"
require "json"

module Pinnacle
  # Details of a phone number that has been successfully purchased and provisioned.
  #  Includes all communication capabilities currently enabled for immediate use.
  class PurchasedNumber
    # @return [String] Purchased phone number in E.164 format.
    attr_reader :number
    # @return [Pinnacle::BuyResponseCapabilities] Enabled communication features for the phone number.
    attr_reader :capabilities
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param number [String] Purchased phone number in E.164 format.
    # @param capabilities [Pinnacle::BuyResponseCapabilities] Enabled communication features for the phone number.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PurchasedNumber]
    def initialize(number:, capabilities:, additional_properties: nil)
      @number = number
      @capabilities = capabilities
      @additional_properties = additional_properties
      @_field_set = { "number": number, "capabilities": capabilities }
    end

    # Deserialize a JSON object to an instance of PurchasedNumber
    #
    # @param json_object [String]
    # @return [Pinnacle::PurchasedNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      number = parsed_json["number"]
      if parsed_json["capabilities"].nil?
        capabilities = nil
      else
        capabilities = parsed_json["capabilities"].to_json
        capabilities = Pinnacle::BuyResponseCapabilities.from_json(json_object: capabilities)
      end
      new(
        number: number,
        capabilities: capabilities,
        additional_properties: struct
      )
    end

    # Serialize an instance of PurchasedNumber to a JSON object
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
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      Pinnacle::BuyResponseCapabilities.validate_raw(obj: obj.capabilities)
    end
  end
end
