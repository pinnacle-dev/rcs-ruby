# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Message with text and/or media files from a phone number.
  class MmsContent
    # @return [Array<String>] URLs of media files in this message. <br>
    #  See [supported media
    #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
    attr_reader :media_urls
    # @return [String] Text content that accompanies the media files.
    attr_reader :text
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param media_urls [Array<String>] URLs of media files in this message. <br>
    #  See [supported media
    #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
    # @param text [String] Text content that accompanies the media files.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MmsContent]
    def initialize(media_urls:, text: OMIT, additional_properties: nil)
      @media_urls = media_urls
      @text = text if text != OMIT
      @additional_properties = additional_properties
      @_field_set = { "mediaUrls": media_urls, "text": text }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MmsContent
    #
    # @param json_object [String]
    # @return [Pinnacle::MmsContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      media_urls = parsed_json["mediaUrls"]
      text = parsed_json["text"]
      new(
        media_urls: media_urls,
        text: text,
        additional_properties: struct
      )
    end

    # Serialize an instance of MmsContent to a JSON object
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
      obj.media_urls.is_a?(Array) != false || raise("Passed value for field obj.media_urls is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end
