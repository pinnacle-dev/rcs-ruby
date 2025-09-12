# frozen_string_literal: true

require_relative "profile_status_enum"
require_relative "get_dlc_campaign_status_response_updates"
require "ostruct"
require "json"

module Pinnacle
  # Response for get DLC campaign status.
  class DlcCampaignStatus
    # @return [String] Summary of errors related to the verification process. <br>
    #  These errors may request additional information or point out erroneous and/or
    #  missing fields.
    attr_reader :error
    # @return [Integer] Id of the DLC campaign.
    attr_reader :id
    # @return [Pinnacle::ProfileStatusEnum] Current review status of the DLC campaign. <br>
    #  `INCOMPLETE`: Not submitted.<br>
    #  `IN REVIEW`: Being reviewed by carriers.<br>
    #  `VERIFIED`: Approved and ready to send messages.<br>
    #  `FAILED`: Issues and errors related to the campaign's details. See
    #  [error](dlc-campaign#response.body.error) for these potential issues.
    attr_reader :status
    # @return [Pinnacle::GetDlcCampaignStatusResponseUpdates] Status of toll free numbers that are being attached to this campaign. <br>
    #  Note that phone numbers can only be attached to `VERIFIED` campaigns via the
    #  [attach campaign endpoint](../phone-numbers/attach-campaign).
    attr_reader :updates
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param error [String] Summary of errors related to the verification process. <br>
    #  These errors may request additional information or point out erroneous and/or
    #  missing fields.
    # @param id [Integer] Id of the DLC campaign.
    # @param status [Pinnacle::ProfileStatusEnum] Current review status of the DLC campaign. <br>
    #  `INCOMPLETE`: Not submitted.<br>
    #  `IN REVIEW`: Being reviewed by carriers.<br>
    #  `VERIFIED`: Approved and ready to send messages.<br>
    #  `FAILED`: Issues and errors related to the campaign's details. See
    #  [error](dlc-campaign#response.body.error) for these potential issues.
    # @param updates [Pinnacle::GetDlcCampaignStatusResponseUpdates] Status of toll free numbers that are being attached to this campaign. <br>
    #  Note that phone numbers can only be attached to `VERIFIED` campaigns via the
    #  [attach campaign endpoint](../phone-numbers/attach-campaign).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::DlcCampaignStatus]
    def initialize(error:, id:, status:, updates:, additional_properties: nil)
      @error = error
      @id = id
      @status = status
      @updates = updates
      @additional_properties = additional_properties
      @_field_set = { "error": error, "id": id, "status": status, "updates": updates }
    end

    # Deserialize a JSON object to an instance of DlcCampaignStatus
    #
    # @param json_object [String]
    # @return [Pinnacle::DlcCampaignStatus]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      error = parsed_json["error"]
      id = parsed_json["id"]
      status = parsed_json["status"]
      if parsed_json["updates"].nil?
        updates = nil
      else
        updates = parsed_json["updates"].to_json
        updates = Pinnacle::GetDlcCampaignStatusResponseUpdates.from_json(json_object: updates)
      end
      new(
        error: error,
        id: id,
        status: status,
        updates: updates,
        additional_properties: struct
      )
    end

    # Serialize an instance of DlcCampaignStatus to a JSON object
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
      obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status.is_a?(Pinnacle::ProfileStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      Pinnacle::GetDlcCampaignStatusResponseUpdates.validate_raw(obj: obj.updates)
    end
  end
end
