# frozen_string_literal: true

require_relative "media_payload"
require_relative "inbound_message_metadata"
require "ostruct"
require "json"

module Pinnacle
  class InboundMediaMessage
    # @return [String]
    attr_reader :message_type
    # @return [String]
    attr_reader :text
    # @return [Array<Pinnacle::MediaPayload>]
    attr_reader :media_urls
    # @return [String]
    attr_reader :from
    # @return [String]
    attr_reader :to
    # @return [Pinnacle::InboundMessageMetadata]
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message_type [String]
    # @param text [String]
    # @param media_urls [Array<Pinnacle::MediaPayload>]
    # @param from [String]
    # @param to [String]
    # @param metadata [Pinnacle::InboundMessageMetadata]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::InboundMediaMessage]
    def initialize(media_urls:, from:, to:, message_type: OMIT, text: OMIT, metadata: OMIT, additional_properties: nil)
      @message_type = message_type if message_type != OMIT
      @text = text if text != OMIT
      @media_urls = media_urls
      @from = from
      @to = to
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messageType": message_type,
        "text": text,
        "mediaUrls": media_urls,
        "from": from,
        "to": to,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InboundMediaMessage
    #
    # @param json_object [String]
    # @return [Pinnacle::InboundMediaMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message_type = parsed_json["messageType"]
      text = parsed_json["text"]
      media_urls = parsed_json["mediaUrls"]&.map do |item|
        item = item.to_json
        Pinnacle::MediaPayload.from_json(json_object: item)
      end
      from = parsed_json["from"]
      to = parsed_json["to"]
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Pinnacle::InboundMessageMetadata.from_json(json_object: metadata)
      end
      new(
        message_type: message_type,
        text: text,
        media_urls: media_urls,
        from: from,
        to: to,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of InboundMediaMessage to a JSON object
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
      obj.message_type&.is_a?(String) != false || raise("Passed value for field obj.message_type is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.media_urls.is_a?(Array) != false || raise("Passed value for field obj.media_urls is not the expected type, validation failed.")
      obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
      obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.metadata.nil? || Pinnacle::InboundMessageMetadata.validate_raw(obj: obj.metadata)
    end
  end
end
