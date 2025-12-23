# frozen_string_literal: true

require_relative "send_rich_cards_options"
require_relative "rich_card"
require_relative "rich_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class RichCardsMessage
      # @return [Pinnacle::Types::SendRichCardsOptions]
      attr_reader :options
      # @return [String] Your RCS agent ID which must be prefixed with 'agent_'.
      attr_reader :from
      # @return [String] Recipient's phone number in E.164 format.
      attr_reader :to
      # @return [Array<Pinnacle::Types::RichCard>] Collection of cards attached to the message.
      attr_reader :cards
      # @return [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message.
      attr_reader :quick_replies
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param options [Pinnacle::Types::SendRichCardsOptions]
      # @param from [String] Your RCS agent ID which must be prefixed with 'agent_'.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param cards [Array<Pinnacle::Types::RichCard>] Collection of cards attached to the message.
      # @param quick_replies [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RichCardsMessage]
      def initialize(from:, to:, cards:, quick_replies:, options: OMIT, additional_properties: nil)
        @options = options if options != OMIT
        @from = from
        @to = to
        @cards = cards
        @quick_replies = quick_replies
        @additional_properties = additional_properties
        @_field_set = {
          "options": options,
          "from": from,
          "to": to,
          "cards": cards,
          "quickReplies": quick_replies
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RichCardsMessage
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RichCardsMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["options"].nil?
          options = nil
        else
          options = parsed_json["options"].to_json
          options = Pinnacle::Types::SendRichCardsOptions.from_json(json_object: options)
        end
        from = parsed_json["from"]
        to = parsed_json["to"]
        cards = parsed_json["cards"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichCard.from_json(json_object: item)
        end
        quick_replies = parsed_json["quickReplies"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichButton.from_json(json_object: item)
        end
        new(
          options: options,
          from: from,
          to: to,
          cards: cards,
          quick_replies: quick_replies,
          additional_properties: struct
        )
      end

      # Serialize an instance of RichCardsMessage to a JSON object
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
        obj.options.nil? || Pinnacle::Types::SendRichCardsOptions.validate_raw(obj: obj.options)
        obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
        obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
        obj.cards.is_a?(Array) != false || raise("Passed value for field obj.cards is not the expected type, validation failed.")
        obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
      end
    end
  end
end
