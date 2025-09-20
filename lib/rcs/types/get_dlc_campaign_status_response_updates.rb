# frozen_string_literal: true

require_relative "dlc_assignment_status_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Status of local long code numbers that are being attached to this campaign. <br>
    #  Note that phone numbers can only be attached to `VERIFIED` campaigns via the
    #  [attach campaign endpoint](../phone-numbers/attach-campaign).
    class GetDlcCampaignStatusResponseUpdates
      # @return [String] Number associated with the campaign in E.164 format.
      attr_reader :number
      # @return [Pinnacle::Types::DlcAssignmentStatusEnum] Current assignment status of the phone number to this campaign. <br>
      #  `ASSIGNED`: Number assigned and ready to send messages.<br>
      #  `PENDING_ASSIGNMENT`: In the process of being assigned. This should take no more
      #  than 10 minutes.<br>
      #  `PENDING_UNASSIGNMENT`: In the process of being unassigned. This should take no
      #  more that 5 minutes.<br>
      #  `FAILED_ASSIGNMENT`: Failed to assign the number. Use the phone number status
      #  endpoint to see errors.<br>
      #  `FAILED_UNASSIGNMENT`: Failed to unassign the number. Use the phone number
      #  status endpoint to see errors.
      attr_reader :status
      # @return [Array<String>] List of errors that occurred.
      attr_reader :errors
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param number [String] Number associated with the campaign in E.164 format.
      # @param status [Pinnacle::Types::DlcAssignmentStatusEnum] Current assignment status of the phone number to this campaign. <br>
      #  `ASSIGNED`: Number assigned and ready to send messages.<br>
      #  `PENDING_ASSIGNMENT`: In the process of being assigned. This should take no more
      #  than 10 minutes.<br>
      #  `PENDING_UNASSIGNMENT`: In the process of being unassigned. This should take no
      #  more that 5 minutes.<br>
      #  `FAILED_ASSIGNMENT`: Failed to assign the number. Use the phone number status
      #  endpoint to see errors.<br>
      #  `FAILED_UNASSIGNMENT`: Failed to unassign the number. Use the phone number
      #  status endpoint to see errors.
      # @param errors [Array<String>] List of errors that occurred.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::GetDlcCampaignStatusResponseUpdates]
      def initialize(number:, status:, errors:, additional_properties: nil)
        @number = number
        @status = status
        @errors = errors
        @additional_properties = additional_properties
        @_field_set = { "number": number, "status": status, "errors": errors }
      end

      # Deserialize a JSON object to an instance of GetDlcCampaignStatusResponseUpdates
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::GetDlcCampaignStatusResponseUpdates]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        number = parsed_json["number"]
        status = parsed_json["status"]
        errors = parsed_json["errors"]
        new(
          number: number,
          status: status,
          errors: errors,
          additional_properties: struct
        )
      end

      # Serialize an instance of GetDlcCampaignStatusResponseUpdates to a JSON object
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
        obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.status.is_a?(Pinnacle::Types::DlcAssignmentStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      end
    end
  end
end
