# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # The content of the message
  class SmsMessage
    # @return [String] The body of the SMS message
    attr_reader :body
    # @return [String] Optional media URL for the SMS message
    attr_reader :media_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param body [String] The body of the SMS message
    # @param media_url [String] Optional media URL for the SMS message
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SmsMessage]
    def initialize(body:, media_url: OMIT, additional_properties: nil)
      @body = body
      @media_url = media_url if media_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "body": body, "mediaUrl": media_url }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SmsMessage
    #
    # @param json_object [String]
    # @return [Pinnacle::SmsMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      body = parsed_json["body"]
      media_url = parsed_json["mediaUrl"]
      new(
        body: body,
        media_url: media_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of SmsMessage to a JSON object
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
      obj.body.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      obj.media_url&.is_a?(String) != false || raise("Passed value for field obj.media_url is not the expected type, validation failed.")
    end
  end
end
