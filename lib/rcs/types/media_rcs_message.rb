# frozen_string_literal: true

require_relative "media_type"
require_relative "action"
require "ostruct"
require "json"

module Pinnacle
  # The content of the message
  class MediaRcsMessage
    # @return [Pinnacle::MediaType]
    attr_reader :media_type
    # @return [String] The URL of the media being sent
    attr_reader :media_url
    # @return [Array<Pinnacle::Action>] Array of quick replies attached to the media. Maximum of 11 quick replies.
    attr_reader :quick_replies
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param media_type [Pinnacle::MediaType]
    # @param media_url [String] The URL of the media being sent
    # @param quick_replies [Array<Pinnacle::Action>] Array of quick replies attached to the media. Maximum of 11 quick replies.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MediaRcsMessage]
    def initialize(media_type:, media_url:, quick_replies: OMIT, additional_properties: nil)
      @media_type = media_type
      @media_url = media_url
      @quick_replies = quick_replies if quick_replies != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "mediaType": media_type,
        "mediaUrl": media_url,
        "quick_replies": quick_replies
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MediaRcsMessage
    #
    # @param json_object [String]
    # @return [Pinnacle::MediaRcsMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      media_type = parsed_json["mediaType"]
      media_url = parsed_json["mediaUrl"]
      quick_replies = parsed_json["quick_replies"]&.map do |item|
        item = item.to_json
        Pinnacle::Action.from_json(json_object: item)
      end
      new(
        media_type: media_type,
        media_url: media_url,
        quick_replies: quick_replies,
        additional_properties: struct
      )
    end

    # Serialize an instance of MediaRcsMessage to a JSON object
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
      obj.media_type.is_a?(Pinnacle::MediaType) != false || raise("Passed value for field obj.media_type is not the expected type, validation failed.")
      obj.media_url.is_a?(String) != false || raise("Passed value for field obj.media_url is not the expected type, validation failed.")
      obj.quick_replies&.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
    end
  end
end
