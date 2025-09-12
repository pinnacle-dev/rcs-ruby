# frozen_string_literal: true

require_relative "rcs_cards_content_cards_item"
require_relative "rcs_button_content"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Message containing cards, each with its own title, subtitle, and/or buttons.
    #  Quick replies can also be added. <br>
    #  See (supported file
    #  types)[https://app.pinnacle.sh/supported-file-types?type=RCS-CARD].
    class RcsCardsContent
      # @return [Array<Pinnacle::Types::RcsCardsContentCardsItem>] Collection of cards attached to the message.
      attr_reader :cards
      # @return [Array<Pinnacle::Types::RcsButtonContent>] List of interactive quick reply buttons in the message.
      attr_reader :quick_replies
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param cards [Array<Pinnacle::Types::RcsCardsContentCardsItem>] Collection of cards attached to the message.
      # @param quick_replies [Array<Pinnacle::Types::RcsButtonContent>] List of interactive quick reply buttons in the message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCardsContent]
      def initialize(cards:, quick_replies:, additional_properties: nil)
        @cards = cards
        @quick_replies = quick_replies
        @additional_properties = additional_properties
        @_field_set = { "cards": cards, "quickReplies": quick_replies }
      end

      # Deserialize a JSON object to an instance of RcsCardsContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCardsContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        cards = parsed_json["cards"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCardsContentCardsItem.from_json(json_object: item)
        end
        quick_replies = parsed_json["quickReplies"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsButtonContent.from_json(json_object: item)
        end
        new(
          cards: cards,
          quick_replies: quick_replies,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCardsContent to a JSON object
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
        obj.cards.is_a?(Array) != false || raise("Passed value for field obj.cards is not the expected type, validation failed.")
        obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
      end
    end
  end
end
