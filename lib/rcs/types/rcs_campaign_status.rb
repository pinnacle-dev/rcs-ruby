# frozen_string_literal: true

require_relative "profile_status_enum"
require "ostruct"
require "json"

module Pinnacle
  # Response for get RCS campaign status.
  class RcsCampaignStatus
    # @return [Array<String>] List of errors that occured.
    attr_reader :errors
    # @return [Integer] Id of the RCS campaign.
    attr_reader :id
    # @return [Pinnacle::ProfileStatusEnum] Current review status of the RCS campaign. <br>
    #  `INCOMPLETE`: Not submitted.<br>
    #  `IN REVIEW`: Being reviewed by carriers.<br>
    #  `VERIFIED`: Approved and ready to send messages.<br>
    #  `FAILED`: Issues and errors related to the campaign's details. See
    #  [errors](rcs-campaign#response.body.errors) for these potential issues.<br>
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<String>] List of errors that occured.
    # @param id [Integer] Id of the RCS campaign.
    # @param status [Pinnacle::ProfileStatusEnum] Current review status of the RCS campaign. <br>
    #  `INCOMPLETE`: Not submitted.<br>
    #  `IN REVIEW`: Being reviewed by carriers.<br>
    #  `VERIFIED`: Approved and ready to send messages.<br>
    #  `FAILED`: Issues and errors related to the campaign's details. See
    #  [errors](rcs-campaign#response.body.errors) for these potential issues.<br>
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsCampaignStatus]
    def initialize(errors:, id:, status:, additional_properties: nil)
      @errors = errors
      @id = id
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "id": id, "status": status }
    end

    # Deserialize a JSON object to an instance of RcsCampaignStatus
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsCampaignStatus]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]
      id = parsed_json["id"]
      status = parsed_json["status"]
      new(
        errors: errors,
        id: id,
        status: status,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsCampaignStatus to a JSON object
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
      obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status.is_a?(Pinnacle::ProfileStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
