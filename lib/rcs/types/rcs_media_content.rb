# frozen_string_literal: true

require_relative "rcs_media_details_content"
require_relative "rcs_button_content"
require "ostruct"
require "json"

module Pinnacle
  # Message containing a media file and/or text with optional quick reply buttons.
  #  <br>
  #  See (supported file
  #  types)[https://app.pinnacle.sh/supported-file-types?type=RCS-MEDIA].
  class RcsMediaContent
    # @return [Pinnacle::RcsMediaDetailsContent]
    attr_reader :media
    # @return [Array<Pinnacle::RcsButtonContent>] List of interactive quick reply buttons in the message.
    attr_reader :quick_replies
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param media [Pinnacle::RcsMediaDetailsContent]
    # @param quick_replies [Array<Pinnacle::RcsButtonContent>] List of interactive quick reply buttons in the message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsMediaContent]
    def initialize(media:, quick_replies:, additional_properties: nil)
      @media = media
      @quick_replies = quick_replies
      @additional_properties = additional_properties
      @_field_set = { "media": media, "quickReplies": quick_replies }
    end

    # Deserialize a JSON object to an instance of RcsMediaContent
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsMediaContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["media"].nil?
        media = nil
      else
        media = parsed_json["media"].to_json
        media = Pinnacle::RcsMediaDetailsContent.from_json(json_object: media)
      end
      quick_replies = parsed_json["quickReplies"]&.map do |item|
        item = item.to_json
        Pinnacle::RcsButtonContent.from_json(json_object: item)
      end
      new(
        media: media,
        quick_replies: quick_replies,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsMediaContent to a JSON object
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
      Pinnacle::RcsMediaDetailsContent.validate_raw(obj: obj.media)
      obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
    end
  end
end
