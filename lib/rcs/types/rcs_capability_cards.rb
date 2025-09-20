# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class RcsCapabilityCards
      # @return [Boolean] Whether the phone number supports standalone rich cards (`cards.length == 1`)
      attr_reader :standalone
      # @return [Boolean] Whether the phone number supports carousel rich cards
      attr_reader :carousel
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param standalone [Boolean] Whether the phone number supports standalone rich cards (`cards.length == 1`)
      # @param carousel [Boolean] Whether the phone number supports carousel rich cards
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCapabilityCards]
      def initialize(standalone:, carousel:, additional_properties: nil)
        @standalone = standalone
        @carousel = carousel
        @additional_properties = additional_properties
        @_field_set = { "standalone": standalone, "carousel": carousel }
      end

      # Deserialize a JSON object to an instance of RcsCapabilityCards
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCapabilityCards]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        standalone = parsed_json["standalone"]
        carousel = parsed_json["carousel"]
        new(
          standalone: standalone,
          carousel: carousel,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCapabilityCards to a JSON object
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
        obj.standalone.is_a?(Boolean) != false || raise("Passed value for field obj.standalone is not the expected type, validation failed.")
        obj.carousel.is_a?(Boolean) != false || raise("Passed value for field obj.carousel is not the expected type, validation failed.")
      end
    end
  end
end
