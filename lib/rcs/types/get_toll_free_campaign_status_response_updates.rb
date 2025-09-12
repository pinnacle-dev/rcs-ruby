# frozen_string_literal: true

require_relative "toll_free_status_enum"
require "ostruct"
require "json"

module Pinnacle
  # Status of phone numbers that are being attached to this campaign. <br>
  #  Note that phone numbers can only be attached to `VERIFIED` campaigns via the
  #  [attach campaign endpoint](../phone-numbers/attach-campaign).
  class GetTollFreeCampaignStatusResponseUpdates
    # @return [Array<String>] List of errors that occurred.
    attr_reader :errors
    # @return [String] Number associated with the campaign in E.164 format.
    attr_reader :number
    # @return [Pinnacle::TollFreeStatusEnum] Current assignment status of the toll free number to this campaign. <br>
    #  `IN_PROGRESS`: Being reviewed.<br>
    #  `WAITING_FOR_PROVIDER`: Being reviewed by our toll-free vendor.<br>
    #  `WAITING_FOR_TELECO:` Final review by carriers before number is live.<br>
    #  `VERIFIED`: Verified and ready to send messages.<br>
    #  `REJECTED`: Issues were found related to your campaign. See the [errors
    #  field](toll-free-campaign#response.body.error).
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<String>] List of errors that occurred.
    # @param number [String] Number associated with the campaign in E.164 format.
    # @param status [Pinnacle::TollFreeStatusEnum] Current assignment status of the toll free number to this campaign. <br>
    #  `IN_PROGRESS`: Being reviewed.<br>
    #  `WAITING_FOR_PROVIDER`: Being reviewed by our toll-free vendor.<br>
    #  `WAITING_FOR_TELECO:` Final review by carriers before number is live.<br>
    #  `VERIFIED`: Verified and ready to send messages.<br>
    #  `REJECTED`: Issues were found related to your campaign. See the [errors
    #  field](toll-free-campaign#response.body.error).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::GetTollFreeCampaignStatusResponseUpdates]
    def initialize(errors:, number:, status:, additional_properties: nil)
      @errors = errors
      @number = number
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "number": number, "status": status }
    end

    # Deserialize a JSON object to an instance of
    #  GetTollFreeCampaignStatusResponseUpdates
    #
    # @param json_object [String]
    # @return [Pinnacle::GetTollFreeCampaignStatusResponseUpdates]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]
      number = parsed_json["number"]
      status = parsed_json["status"]
      new(
        errors: errors,
        number: number,
        status: status,
        additional_properties: struct
      )
    end

    # Serialize an instance of GetTollFreeCampaignStatusResponseUpdates to a JSON
    #  object
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
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.status.is_a?(Pinnacle::TollFreeStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
