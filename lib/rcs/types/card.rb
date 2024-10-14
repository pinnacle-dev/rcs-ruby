# frozen_string_literal: true

require_relative "action"
require "ostruct"
require "json"

module Pinnacle
  class Card
    # @return [String] The title of the card.
    attr_reader :title
    # @return [String] Optional subtitle for the card.
    attr_reader :subtitle
    # @return [String] Optional media URL displayed with the card.
    attr_reader :media_url
    # @return [Array<Pinnacle::Action>] Optional list of buttons on the card (max 4).
    attr_reader :buttons
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title of the card.
    # @param subtitle [String] Optional subtitle for the card.
    # @param media_url [String] Optional media URL displayed with the card.
    # @param buttons [Array<Pinnacle::Action>] Optional list of buttons on the card (max 4).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Card]
    def initialize(title:, subtitle: OMIT, media_url: OMIT, buttons: OMIT, additional_properties: nil)
      @title = title
      @subtitle = subtitle if subtitle != OMIT
      @media_url = media_url if media_url != OMIT
      @buttons = buttons if buttons != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "subtitle": subtitle,
        "mediaUrl": media_url,
        "buttons": buttons
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
      media_url = parsed_json["mediaUrl"]
      buttons = parsed_json["buttons"]&.map do |item|
        item = item.to_json
        Pinnacle::Action.from_json(json_object: item)
      end
      new(
        title: title,
        subtitle: subtitle,
        media_url: media_url,
        buttons: buttons,
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
      obj.media_url&.is_a?(String) != false || raise("Passed value for field obj.media_url is not the expected type, validation failed.")
      obj.buttons&.is_a?(Array) != false || raise("Passed value for field obj.buttons is not the expected type, validation failed.")
    end
  end
end
