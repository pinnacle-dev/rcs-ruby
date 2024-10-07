# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class BadRequestErrorBodyError
    # @return [String]
    attr_reader :code
    # @return [String]
    attr_reader :expected
    # @return [String]
    attr_reader :received
    # @return [Array<String>]
    attr_reader :path
    # @return [String]
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param code [String]
    # @param expected [String]
    # @param received [String]
    # @param path [Array<String>]
    # @param message [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::BadRequestErrorBodyError]
    def initialize(code: OMIT, expected: OMIT, received: OMIT, path: OMIT, message: OMIT, additional_properties: nil)
      @code = code if code != OMIT
      @expected = expected if expected != OMIT
      @received = received if received != OMIT
      @path = path if path != OMIT
      @message = message if message != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "code": code,
        "expected": expected,
        "received": received,
        "path": path,
        "message": message
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of BadRequestErrorBodyError
    #
    # @param json_object [String]
    # @return [Pinnacle::BadRequestErrorBodyError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      code = parsed_json["code"]
      expected = parsed_json["expected"]
      received = parsed_json["received"]
      path = parsed_json["path"]
      message = parsed_json["message"]
      new(
        code: code,
        expected: expected,
        received: received,
        path: path,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of BadRequestErrorBodyError to a JSON object
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
      obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.expected&.is_a?(String) != false || raise("Passed value for field obj.expected is not the expected type, validation failed.")
      obj.received&.is_a?(String) != false || raise("Passed value for field obj.received is not the expected type, validation failed.")
      obj.path&.is_a?(Array) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
    end
  end
end
