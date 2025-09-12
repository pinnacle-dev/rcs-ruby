# frozen_string_literal: true

require_relative "phone_number_status_enum"
require "ostruct"
require "json"

module Pinnacle
  # Response for get phone number status.
  class PhoneNumberStatus
    # @return [Array<String>] List of errors that occured.
    attr_reader :errors
    # @return [String] Phone number in E164 format that is in review
    attr_reader :phone_number
    # @return [Pinnacle::PhoneNumberStatusEnum] Current status of the phone number. <br>
    #  `PENDING`: Not active during the one or more of the following: purchase pending,
    #  brand or campaign pending verification, and pending assignment to a campaign. To
    #  use a number, make sure to [attach it](../phone-numbers/attach-campaign) to an
    #  active campaign. <br>
    #  `ACTIVE`: Number is ready to send messages. <br>
    #  `FAILURE`: Errors occurred while activating this number. See the [errors
    #  field](phone-number#response.body.errors).
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<String>] List of errors that occured.
    # @param phone_number [String] Phone number in E164 format that is in review
    # @param status [Pinnacle::PhoneNumberStatusEnum] Current status of the phone number. <br>
    #  `PENDING`: Not active during the one or more of the following: purchase pending,
    #  brand or campaign pending verification, and pending assignment to a campaign. To
    #  use a number, make sure to [attach it](../phone-numbers/attach-campaign) to an
    #  active campaign. <br>
    #  `ACTIVE`: Number is ready to send messages. <br>
    #  `FAILURE`: Errors occurred while activating this number. See the [errors
    #  field](phone-number#response.body.errors).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PhoneNumberStatus]
    def initialize(errors:, phone_number:, status:, additional_properties: nil)
      @errors = errors
      @phone_number = phone_number
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "phoneNumber": phone_number, "status": status }
    end

    # Deserialize a JSON object to an instance of PhoneNumberStatus
    #
    # @param json_object [String]
    # @return [Pinnacle::PhoneNumberStatus]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]
      phone_number = parsed_json["phoneNumber"]
      status = parsed_json["status"]
      new(
        errors: errors,
        phone_number: phone_number,
        status: status,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberStatus to a JSON object
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
      obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.status.is_a?(Pinnacle::PhoneNumberStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
