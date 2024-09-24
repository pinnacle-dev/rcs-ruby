# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class SendResponse
    # @return [String] Confirmation message that the message was sent successfully
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] Confirmation message that the message was sent successfully
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SendResponse]
    def initialize(message: OMIT, additional_properties: nil)
      @message = message if message != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SendResponse
    #
    # @param json_object [String]
    # @return [Pinnacle::SendResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      new(message: message, additional_properties: struct)
    end

    # Serialize an instance of SendResponse to a JSON object
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
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
    end
  end
end
