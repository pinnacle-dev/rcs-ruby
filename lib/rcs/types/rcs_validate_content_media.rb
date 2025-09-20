# frozen_string_literal: true

require_relative "rich_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Message containing a media file and/or text with optional quick reply
    #  buttons.<br>
    #  See [supported media
    #  types](https://app.pinnacle.sh/supported-file-types?type=RCS-MEDIA).
    class RcsValidateContentMedia
      # @return [String] Media file URLs to send.
      attr_reader :media
      # @return [Array<Pinnacle::Types::RichButton>]
      attr_reader :quick_replies
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param media [String] Media file URLs to send.
      # @param quick_replies [Array<Pinnacle::Types::RichButton>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsValidateContentMedia]
      def initialize(media:, quick_replies:, additional_properties: nil)
        @media = media
        @quick_replies = quick_replies
        @additional_properties = additional_properties
        @_field_set = { "media": media, "quickReplies": quick_replies }
      end

      # Deserialize a JSON object to an instance of RcsValidateContentMedia
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsValidateContentMedia]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        media = parsed_json["media"]
        quick_replies = parsed_json["quickReplies"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichButton.from_json(json_object: item)
        end
        new(
          media: media,
          quick_replies: quick_replies,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsValidateContentMedia to a JSON object
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
        obj.media.is_a?(String) != false || raise("Passed value for field obj.media is not the expected type, validation failed.")
        obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
      end
    end
  end
end
