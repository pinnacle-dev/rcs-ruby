# frozen_string_literal: true

require_relative "action"
require_relative "card_style"
require "ostruct"
require "json"

module Pinnacle
  class Card
    # @return [String] The title of the card
    attr_reader :title
    # @return [String] The subtitle of the card
    attr_reader :subtitle
    # @return [String] The URL of the image to be displayed on the card
    attr_reader :image_url
    # @return [Array<Pinnacle::Action>] Array of buttons attached to the card. Maximum of 4 buttons.
    attr_reader :buttons
    # @return [Pinnacle::CardStyle] The style of the card
    attr_reader :card_style
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title of the card
    # @param subtitle [String] The subtitle of the card
    # @param image_url [String] The URL of the image to be displayed on the card
    # @param buttons [Array<Pinnacle::Action>] Array of buttons attached to the card. Maximum of 4 buttons.
    # @param card_style [Pinnacle::CardStyle] The style of the card
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Card]
    def initialize(title:, image_url:, subtitle: OMIT, buttons: OMIT, card_style: OMIT, additional_properties: nil)
      @title = title
      @subtitle = subtitle if subtitle != OMIT
      @image_url = image_url
      @buttons = buttons if buttons != OMIT
      @card_style = card_style if card_style != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "subtitle": subtitle,
        "image_url": image_url,
        "buttons": buttons,
        "card_style": card_style
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Card
    #
    # @param json_object [String]
    # @return [Pinnacle::Card]
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
        card_style = Pinnacle::CardStyle.from_json(json_object: card_style)
      end
      new(
        title: title,
        subtitle: subtitle,
        image_url: image_url,
        buttons: buttons,
        card_style: card_style,
        additional_properties: struct
      )
    end

    # Serialize an instance of Card to a JSON object
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
      obj.image_url.is_a?(String) != false || raise("Passed value for field obj.image_url is not the expected type, validation failed.")
      obj.buttons&.is_a?(Array) != false || raise("Passed value for field obj.buttons is not the expected type, validation failed.")
      obj.card_style.nil? || Pinnacle::CardStyle.validate_raw(obj: obj.card_style)
    end
  end
end
