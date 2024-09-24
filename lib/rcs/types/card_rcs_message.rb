# frozen_string_literal: true

require_relative "card"
require_relative "action"
require "ostruct"
require "json"

module Pinnacle
  # The content of the message
  class CardRcsMessage
    # @return [Array<Pinnacle::Card>] Array of one containing the card to be sent
    attr_reader :cards
    # @return [Array<Pinnacle::Action>] Array of quick replies attached to the card. Maximum of 11 quick replies.
    attr_reader :quick_replies
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param cards [Array<Pinnacle::Card>] Array of one containing the card to be sent
    # @param quick_replies [Array<Pinnacle::Action>] Array of quick replies attached to the card. Maximum of 11 quick replies.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CardRcsMessage]
    def initialize(cards:, quick_replies: OMIT, additional_properties: nil)
      @cards = cards
      @quick_replies = quick_replies if quick_replies != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cards": cards, "quick_replies": quick_replies }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CardRcsMessage
    #
    # @param json_object [String]
    # @return [Pinnacle::CardRcsMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      cards = parsed_json["cards"]&.map do |item|
        item = item.to_json
        Pinnacle::Card.from_json(json_object: item)
      end
      quick_replies = parsed_json["quick_replies"]&.map do |item|
        item = item.to_json
        Pinnacle::Action.from_json(json_object: item)
      end
      new(
        cards: cards,
        quick_replies: quick_replies,
        additional_properties: struct
      )
    end

    # Serialize an instance of CardRcsMessage to a JSON object
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
      obj.quick_replies&.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
    end
  end
end
