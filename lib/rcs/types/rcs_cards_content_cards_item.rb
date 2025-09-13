# frozen_string_literal: true

require_relative "rich_button"
require_relative "rcs_media_details_content"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Individual card containing title, optional media, and action buttons.
    class RcsCardsContentCardsItem
      # @return [Array<Pinnacle::Types::RichButton>] Action buttons attached to the card.
      attr_reader :buttons
      # @return [Pinnacle::Types::RcsMediaDetailsContent]
      attr_reader :media
      # @return [String] Secondary text displayed below the title for additional context.
      attr_reader :subtitle
      # @return [String] Title displayed on the card.
      attr_reader :title
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param buttons [Array<Pinnacle::Types::RichButton>] Action buttons attached to the card.
      # @param media [Pinnacle::Types::RcsMediaDetailsContent]
      # @param subtitle [String] Secondary text displayed below the title for additional context.
      # @param title [String] Title displayed on the card.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCardsContentCardsItem]
      def initialize(buttons:, title:, media: OMIT, subtitle: OMIT, additional_properties: nil)
        @buttons = buttons
        @media = media if media != OMIT
        @subtitle = subtitle if subtitle != OMIT
        @title = title
        @additional_properties = additional_properties
        @_field_set = { "buttons": buttons, "media": media, "subtitle": subtitle, "title": title }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCardsContentCardsItem
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCardsContentCardsItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        buttons = parsed_json["buttons"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichButton.from_json(json_object: item)
        end
        if parsed_json["media"].nil?
          media = nil
        else
          media = parsed_json["media"].to_json
          media = Pinnacle::Types::RcsMediaDetailsContent.from_json(json_object: media)
        end
        subtitle = parsed_json["subtitle"]
        title = parsed_json["title"]
        new(
          buttons: buttons,
          media: media,
          subtitle: subtitle,
          title: title,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCardsContentCardsItem to a JSON object
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
        obj.buttons.is_a?(Array) != false || raise("Passed value for field obj.buttons is not the expected type, validation failed.")
        obj.media.nil? || Pinnacle::Types::RcsMediaDetailsContent.validate_raw(obj: obj.media)
        obj.subtitle&.is_a?(String) != false || raise("Passed value for field obj.subtitle is not the expected type, validation failed.")
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      end
    end
  end
end
