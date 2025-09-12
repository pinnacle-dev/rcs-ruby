# frozen_string_literal: true

require_relative "phone_capabilities"
require "ostruct"
require "json"

module Pinnacle
  # Information about a phone number sender in a conversation.
  class Phone
    # @return [Pinnacle::PhoneCapabilities]
    attr_reader :capabilities
    # @return [String] ISO 8601 timestamp when the phone sender was created.
    attr_reader :created_at
    # @return [Boolean] Whether this phone number is in sandbox/testing mode.
    attr_reader :is_sandbox
    # @return [String] The sender's phone number in E.164 format.
    attr_reader :phone_number
    # @return [String] ISO 8601 timestamp when the phone sender was last updated
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param capabilities [Pinnacle::PhoneCapabilities]
    # @param created_at [String] ISO 8601 timestamp when the phone sender was created.
    # @param is_sandbox [Boolean] Whether this phone number is in sandbox/testing mode.
    # @param phone_number [String] The sender's phone number in E.164 format.
    # @param updated_at [String] ISO 8601 timestamp when the phone sender was last updated
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Phone]
    def initialize(capabilities:, created_at:, is_sandbox:, phone_number:, updated_at:, additional_properties: nil)
      @capabilities = capabilities
      @created_at = created_at
      @is_sandbox = is_sandbox
      @phone_number = phone_number
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "capabilities": capabilities,
        "createdAt": created_at,
        "isSandbox": is_sandbox,
        "phoneNumber": phone_number,
        "updatedAt": updated_at
      }
    end

    # Deserialize a JSON object to an instance of Phone
    #
    # @param json_object [String]
    # @return [Pinnacle::Phone]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["capabilities"].nil?
        capabilities = nil
      else
        capabilities = parsed_json["capabilities"].to_json
        capabilities = Pinnacle::PhoneCapabilities.from_json(json_object: capabilities)
      end
      created_at = parsed_json["createdAt"]
      is_sandbox = parsed_json["isSandbox"]
      phone_number = parsed_json["phoneNumber"]
      updated_at = parsed_json["updatedAt"]
      new(
        capabilities: capabilities,
        created_at: created_at,
        is_sandbox: is_sandbox,
        phone_number: phone_number,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of Phone to a JSON object
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
      Pinnacle::PhoneCapabilities.validate_raw(obj: obj.capabilities)
      obj.created_at.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.is_sandbox.is_a?(Boolean) != false || raise("Passed value for field obj.is_sandbox is not the expected type, validation failed.")
      obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.updated_at.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
