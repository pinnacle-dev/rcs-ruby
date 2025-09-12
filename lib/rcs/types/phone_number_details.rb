# frozen_string_literal: true

require_relative "phone_enum"
require_relative "phone_number_cost"
require_relative "phone_feature_enum"
require_relative "phone_number_region"
require "ostruct"
require "json"

module Pinnacle
  # Details of a phone number available for purchase.
  #  Includes all essential data required for acquisition and operational planning.
  class PhoneNumberDetails
    # @return [String] Phone number in E.164 format.
    attr_reader :number
    # @return [Pinnacle::PhoneEnum] Classification that defines the number's billing model and geographic scope.
    attr_reader :phone_type
    # @return [Pinnacle::PhoneNumberCost] Pricing details for the phone number.
    attr_reader :cost
    # @return [Array<Pinnacle::PhoneFeatureEnum>] Supported communication capabilities associated with the number.
    attr_reader :features
    # @return [Pinnacle::PhoneNumberRegion] Geographic and routing information for the phone number.
    attr_reader :region
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param number [String] Phone number in E.164 format.
    # @param phone_type [Pinnacle::PhoneEnum] Classification that defines the number's billing model and geographic scope.
    # @param cost [Pinnacle::PhoneNumberCost] Pricing details for the phone number.
    # @param features [Array<Pinnacle::PhoneFeatureEnum>] Supported communication capabilities associated with the number.
    # @param region [Pinnacle::PhoneNumberRegion] Geographic and routing information for the phone number.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PhoneNumberDetails]
    def initialize(number:, phone_type:, cost:, features:, region:, additional_properties: nil)
      @number = number
      @phone_type = phone_type
      @cost = cost
      @features = features
      @region = region
      @additional_properties = additional_properties
      @_field_set = { "number": number, "phone_type": phone_type, "cost": cost, "features": features, "region": region }
    end

    # Deserialize a JSON object to an instance of PhoneNumberDetails
    #
    # @param json_object [String]
    # @return [Pinnacle::PhoneNumberDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      number = parsed_json["number"]
      phone_type = parsed_json["phone_type"]
      if parsed_json["cost"].nil?
        cost = nil
      else
        cost = parsed_json["cost"].to_json
        cost = Pinnacle::PhoneNumberCost.from_json(json_object: cost)
      end
      features = parsed_json["features"]
      if parsed_json["region"].nil?
        region = nil
      else
        region = parsed_json["region"].to_json
        region = Pinnacle::PhoneNumberRegion.from_json(json_object: region)
      end
      new(
        number: number,
        phone_type: phone_type,
        cost: cost,
        features: features,
        region: region,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberDetails to a JSON object
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
      obj.phone_type.is_a?(Pinnacle::PhoneEnum) != false || raise("Passed value for field obj.phone_type is not the expected type, validation failed.")
      Pinnacle::PhoneNumberCost.validate_raw(obj: obj.cost)
      obj.features.is_a?(Array) != false || raise("Passed value for field obj.features is not the expected type, validation failed.")
      Pinnacle::PhoneNumberRegion.validate_raw(obj: obj.region)
    end
  end
end
