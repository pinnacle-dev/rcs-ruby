# frozen_string_literal: true

require_relative "rcs_capability_cards"
require_relative "rcs_capability_actions"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # RCS capabilities for a phone number
    class RcsCapability
      # @return [Pinnacle::Types::RcsCapabilityCards]
      attr_reader :cards
      # @return [Pinnacle::Types::RcsCapabilityActions] Supported button action types inside the rich cards or quick replies. Each key
      #  is a button action type that defines a specific button type in the Pinnacle API.
      attr_reader :actions
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param cards [Pinnacle::Types::RcsCapabilityCards]
      # @param actions [Pinnacle::Types::RcsCapabilityActions] Supported button action types inside the rich cards or quick replies. Each key
      #  is a button action type that defines a specific button type in the Pinnacle API.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCapability]
      def initialize(cards:, actions:, additional_properties: nil)
        @cards = cards
        @actions = actions
        @additional_properties = additional_properties
        @_field_set = { "cards": cards, "actions": actions }
      end

      # Deserialize a JSON object to an instance of RcsCapability
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCapability]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["cards"].nil?
          cards = nil
        else
          cards = parsed_json["cards"].to_json
          cards = Pinnacle::Types::RcsCapabilityCards.from_json(json_object: cards)
        end
        if parsed_json["actions"].nil?
          actions = nil
        else
          actions = parsed_json["actions"].to_json
          actions = Pinnacle::Types::RcsCapabilityActions.from_json(json_object: actions)
        end
        new(
          cards: cards,
          actions: actions,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCapability to a JSON object
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
        Pinnacle::Types::RcsCapabilityCards.validate_raw(obj: obj.cards)
        Pinnacle::Types::RcsCapabilityActions.validate_raw(obj: obj.actions)
      end
    end
  end
end
