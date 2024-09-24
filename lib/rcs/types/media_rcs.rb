# frozen_string_literal: true

require_relative "media_rcs_message"
require "ostruct"
require "json"

module Pinnacle
  class MediaRcs
    # @return [String] Phone number to send the SMS message to
    attr_reader :phone_number
    # @return [String] The type of message being sent
    attr_reader :message_type
    # @return [Pinnacle::MediaRcsMessage] The content of the message
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [String] Phone number to send the SMS message to
    # @param message_type [String] The type of message being sent
    # @param message [Pinnacle::MediaRcsMessage] The content of the message
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MediaRcs]
    def initialize(message_type:, message:, phone_number: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @message_type = message_type
      @message = message
      @additional_properties = additional_properties
      @_field_set = {
        "phone_number": phone_number,
        "message_type": message_type,
        "message": message
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MediaRcs
    #
    # @param json_object [String]
    # @return [Pinnacle::MediaRcs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      phone_number = parsed_json["phone_number"]
      message_type = parsed_json["message_type"]
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Pinnacle::MediaRcsMessage.from_json(json_object: message)
      end
      new(
        phone_number: phone_number,
        message_type: message_type,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of MediaRcs to a JSON object
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
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.message_type.is_a?(String) != false || raise("Passed value for field obj.message_type is not the expected type, validation failed.")
      Pinnacle::MediaRcsMessage.validate_raw(obj: obj.message)
    end
  end
end
