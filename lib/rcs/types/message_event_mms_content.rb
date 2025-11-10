# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # MMS message with text and/or media files from a phone number.
    class MessageEventMmsContent
      # @return [String] Message type identifier.
      attr_reader :type
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [Array<String>] URLs of media files in this message. <br>
      #  See [supported media
      #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
      attr_reader :media_urls
      # @return [String] Text content that may accompany the media files.
      attr_reader :text
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
      # @param media_urls [Array<String>] URLs of media files in this message. <br>
      #  See [supported media
      #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
      # @param text [String] Text content that may accompany the media files.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventMmsContent]
      def initialize(type:, id:, media_urls:, text: OMIT, additional_properties: nil)
        @type = type
        @id = id
        @media_urls = media_urls
        @text = text if text != OMIT
        @additional_properties = additional_properties
        @_field_set = { "type": type, "id": id, "mediaUrls": media_urls, "text": text }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MessageEventMmsContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventMmsContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        id = parsed_json["id"]
        media_urls = parsed_json["mediaUrls"]
        text = parsed_json["text"]
        new(
          type: type,
          id: id,
          media_urls: media_urls,
          text: text,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventMmsContent to a JSON object
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
        obj.media_urls.is_a?(Array) != false || raise("Passed value for field obj.media_urls is not the expected type, validation failed.")
        obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      end
    end
  end
end
