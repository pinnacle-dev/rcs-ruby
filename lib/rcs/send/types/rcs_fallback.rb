# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Send
    class RcsFallback
      # @return [String] The sender's phone number in E.164 format. Must be owned by the user.
      attr_reader :from
      # @return [String] The fallback message content (max 1600 characters). One of 'text' or 'mediaUrls'
      #  must be provided.
      attr_reader :text
      # @return [Array<String>] The URLs of media to include. One of 'text' or 'mediaUrls' must be provided.
      #  `jpeg`, `jpg`, `gif`, and `png` file types are fully supported and have a size
      #  limit of 5 MB. 500 KB limit for other types. Up to 10 media URLs can be
      #  included.
      attr_reader :media_urls
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param from [String] The sender's phone number in E.164 format. Must be owned by the user.
      # @param text [String] The fallback message content (max 1600 characters). One of 'text' or 'mediaUrls'
      #  must be provided.
      # @param media_urls [Array<String>] The URLs of media to include. One of 'text' or 'mediaUrls' must be provided.
      #  `jpeg`, `jpg`, `gif`, and `png` file types are fully supported and have a size
      #  limit of 5 MB. 500 KB limit for other types. Up to 10 media URLs can be
      #  included.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Send::RcsFallback]
      def initialize(from: OMIT, text: OMIT, media_urls: OMIT, additional_properties: nil)
        @from = from if from != OMIT
        @text = text if text != OMIT
        @media_urls = media_urls if media_urls != OMIT
        @additional_properties = additional_properties
        @_field_set = { "from": from, "text": text, "mediaUrls": media_urls }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsFallback
      #
      # @param json_object [String]
      # @return [Pinnacle::Send::RcsFallback]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        from = parsed_json["from"]
        text = parsed_json["text"]
        media_urls = parsed_json["mediaUrls"]
        new(
          from: from,
          text: text,
          media_urls: media_urls,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsFallback to a JSON object
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
        obj.from&.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
        obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
        obj.media_urls&.is_a?(Array) != false || raise("Passed value for field obj.media_urls is not the expected type, validation failed.")
      end
    end
  end
end
