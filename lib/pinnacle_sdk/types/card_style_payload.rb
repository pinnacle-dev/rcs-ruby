# frozen_string_literal: true

require_relative "card_style_payload_image_alignment"
require_relative "card_style_payload_media_height"
require_relative "card_style_payload_width"
require_relative "card_style_payload_orientation"
require "ostruct"
require "json"

module Pinnacle
  class CardStylePayload
    # @return [Pinnacle::CardStylePayloadImageAlignment]
    attr_reader :image_alignment
    # @return [Pinnacle::CardStylePayloadMediaHeight]
    attr_reader :media_height
    # @return [String]
    attr_reader :thumbnail_url
    # @return [Pinnacle::CardStylePayloadWidth]
    attr_reader :width
    # @return [Pinnacle::CardStylePayloadOrientation]
    attr_reader :orientation
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param image_alignment [Pinnacle::CardStylePayloadImageAlignment]
    # @param media_height [Pinnacle::CardStylePayloadMediaHeight]
    # @param thumbnail_url [String]
    # @param width [Pinnacle::CardStylePayloadWidth]
    # @param orientation [Pinnacle::CardStylePayloadOrientation]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CardStylePayload]
    def initialize(image_alignment:, media_height:, thumbnail_url:, width:, orientation:, additional_properties: nil)
      @image_alignment = image_alignment
      @media_height = media_height
      @thumbnail_url = thumbnail_url
      @width = width
      @orientation = orientation
      @additional_properties = additional_properties
      @_field_set = {
        "image_alignment": image_alignment,
        "media_height": media_height,
        "thumbnail_url": thumbnail_url,
        "width": width,
        "orientation": orientation
      }
    end

    # Deserialize a JSON object to an instance of CardStylePayload
    #
    # @param json_object [String]
    # @return [Pinnacle::CardStylePayload]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      image_alignment = parsed_json["image_alignment"]
      media_height = parsed_json["media_height"]
      thumbnail_url = parsed_json["thumbnail_url"]
      width = parsed_json["width"]
      orientation = parsed_json["orientation"]
      new(
        image_alignment: image_alignment,
        media_height: media_height,
        thumbnail_url: thumbnail_url,
        width: width,
        orientation: orientation,
        additional_properties: struct
      )
    end

    # Serialize an instance of CardStylePayload to a JSON object
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
      obj.image_alignment.is_a?(Pinnacle::CardStylePayloadImageAlignment) != false || raise("Passed value for field obj.image_alignment is not the expected type, validation failed.")
      obj.media_height.is_a?(Pinnacle::CardStylePayloadMediaHeight) != false || raise("Passed value for field obj.media_height is not the expected type, validation failed.")
      obj.thumbnail_url.is_a?(String) != false || raise("Passed value for field obj.thumbnail_url is not the expected type, validation failed.")
      obj.width.is_a?(Pinnacle::CardStylePayloadWidth) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      obj.orientation.is_a?(Pinnacle::CardStylePayloadOrientation) != false || raise("Passed value for field obj.orientation is not the expected type, validation failed.")
    end
  end
end
