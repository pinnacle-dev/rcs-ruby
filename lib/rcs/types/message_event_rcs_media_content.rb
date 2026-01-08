# frozen_string_literal: true

require_relative "rich_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # RCS message containing a media file with optional quick reply buttons. <br>
    #  See [supported file
    #  types](https://app.pinnacle.sh/supported-file-types?type=RCS-MEDIA).
    class MessageEventRcsMediaContent
      # @return [String] Message type identifier.
      attr_reader :type
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [String] URL of the media file.
      attr_reader :media
      # @return [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message. <br><br>
      #  **Limit:** 10 max
      attr_reader :quick_replies
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param type [String] Message type identifier.
      # @param id [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      # @param media [String] URL of the media file.
      # @param quick_replies [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message. <br><br>
      #  **Limit:** 10 max
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventRcsMediaContent]
      def initialize(type:, id:, media:, quick_replies:, additional_properties: nil)
        @type = type
        @id = id
        @media = media
        @quick_replies = quick_replies
        @additional_properties = additional_properties
        @_field_set = { "type": type, "id": id, "media": media, "quickReplies": quick_replies }
      end

      # Deserialize a JSON object to an instance of MessageEventRcsMediaContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventRcsMediaContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        id = parsed_json["id"]
        media = parsed_json["media"]
        quick_replies = parsed_json["quickReplies"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichButton.from_json(json_object: item)
        end
        new(
          type: type,
          id: id,
          media: media,
          quick_replies: quick_replies,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventRcsMediaContent to a JSON object
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
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.media.is_a?(String) != false || raise("Passed value for field obj.media is not the expected type, validation failed.")
        obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
      end
    end
  end
end
