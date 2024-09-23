# frozen_string_literal: true

require_relative "action"
require_relative "card_style_payload"
require "ostruct"
require "json"

module Pinnacle
  class CardPayload
    # @return [String]
    attr_reader :title
    # @return [String]
    attr_reader :subtitle
    # @return [String]
    attr_reader :image_url
    # @return [Array<Pinnacle::Action>]
    attr_reader :buttons
    # @return [Pinnacle::CardStylePayload]
    attr_reader :card_style
    # @return [Array<Pinnacle::Action>]
    attr_reader :quick_replies
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String]
    # @param subtitle [String]
    # @param image_url [String]
    # @param buttons [Array<Pinnacle::Action>]
    # @param card_style [Pinnacle::CardStylePayload]
    # @param quick_replies [Array<Pinnacle::Action>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CardPayload]
    def initialize(title:, buttons:, card_style:, subtitle: OMIT, image_url: OMIT, quick_replies: OMIT,
                   additional_properties: nil)
      @title = title
      @subtitle = subtitle if subtitle != OMIT
      @image_url = image_url if image_url != OMIT
      @buttons = buttons
      @card_style = card_style
      @quick_replies = quick_replies if quick_replies != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "subtitle": subtitle,
        "image_url": image_url,
        "buttons": buttons,
        "card_style": card_style,
        "quick_replies": quick_replies
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CardPayload
    #
    # @param json_object [String]
    # @return [Pinnacle::CardPayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      subtitle = parsed_json["subtitle"]
      image_url = parsed_json["image_url"]
      buttons = parsed_json["buttons"]&.map do |item|
        item = item.to_json
        Pinnacle::Action.from_json(json_object: item)
      end
      if parsed_json["card_style"].nil?
        card_style = nil
      else
        card_style = parsed_json["card_style"].to_json
        card_style = Pinnacle::CardStylePayload.from_json(json_object: card_style)
      end
      quick_replies = parsed_json["quick_replies"]&.map do |item|
        item = item.to_json
        Pinnacle::Action.from_json(json_object: item)
      end
      new(
        title: title,
        subtitle: subtitle,
        image_url: image_url,
        buttons: buttons,
        card_style: card_style,
        quick_replies: quick_replies,
        additional_properties: struct
      )
    end

    # Serialize an instance of CardPayload to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.subtitle&.is_a?(String) != false || raise("Passed value for field obj.subtitle is not the expected type, validation failed.")
      obj.image_url&.is_a?(String) != false || raise("Passed value for field obj.image_url is not the expected type, validation failed.")
      obj.buttons.is_a?(Array) != false || raise("Passed value for field obj.buttons is not the expected type, validation failed.")
      Pinnacle::CardStylePayload.validate_raw(obj: obj.card_style)
      obj.quick_replies&.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
    end
  end
end
