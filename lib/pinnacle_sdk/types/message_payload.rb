# frozen_string_literal: true

require_relative "message_payload_media_type"
require_relative "action"
require_relative "card_payload"
require "ostruct"
require "json"

module Pinnacle
  class MessagePayload
    # @return [String]
    attr_reader :text
    # @return [String]
    attr_reader :media_url
    # @return [Pinnacle::MessagePayloadMediaType]
    attr_reader :media_type
    # @return [Array<Pinnacle::Action>]
    attr_reader :quick_replies
    # @return [Array<Pinnacle::CardPayload>]
    attr_reader :cards
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param text [String]
    # @param media_url [String]
    # @param media_type [Pinnacle::MessagePayloadMediaType]
    # @param quick_replies [Array<Pinnacle::Action>]
    # @param cards [Array<Pinnacle::CardPayload>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MessagePayload]
    def initialize(text: OMIT, media_url: OMIT, media_type: OMIT, quick_replies: OMIT, cards: OMIT,
                   additional_properties: nil)
      @text = text if text != OMIT
      @media_url = media_url if media_url != OMIT
      @media_type = media_type if media_type != OMIT
      @quick_replies = quick_replies if quick_replies != OMIT
      @cards = cards if cards != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "text": text,
        "media_url": media_url,
        "media_type": media_type,
        "quick_replies": quick_replies,
        "cards": cards
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MessagePayload
    #
    # @param json_object [String]
    # @return [Pinnacle::MessagePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = parsed_json["text"]
      media_url = parsed_json["media_url"]
      media_type = parsed_json["media_type"]
      quick_replies = parsed_json["quick_replies"]&.map do |item|
        item = item.to_json
        Pinnacle::Action.from_json(json_object: item)
      end
      cards = parsed_json["cards"]&.map do |item|
        item = item.to_json
        Pinnacle::CardPayload.from_json(json_object: item)
      end
      new(
        text: text,
        media_url: media_url,
        media_type: media_type,
        quick_replies: quick_replies,
        cards: cards,
        additional_properties: struct
      )
    end

    # Serialize an instance of MessagePayload to a JSON object
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
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.media_url&.is_a?(String) != false || raise("Passed value for field obj.media_url is not the expected type, validation failed.")
      obj.media_type&.is_a?(Pinnacle::MessagePayloadMediaType) != false || raise("Passed value for field obj.media_type is not the expected type, validation failed.")
      obj.quick_replies&.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
      obj.cards&.is_a?(Array) != false || raise("Passed value for field obj.cards is not the expected type, validation failed.")
    end
  end
end
