# frozen_string_literal: true

require_relative "messaging_profile_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Campaign that the phone is now detached from.
    class PhoneNumberCampaignDetachPhoneNumbersItemCampaign
      # @return [String] Id of the campaign. For `TOLL_FREE` campaigns, it will begin with the prefix
      #  `tf_`, for example: `tf_1234567890`. For `10DLC` campaigns, it will begin with
      #  the prefix `dlc_`, for example: `dlc_1234567890`.
      attr_reader :id
      # @return [String] Campaign's name.
      attr_reader :name
      # @return [Pinnacle::Types::MessagingProfileEnum]
      attr_reader :type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] Id of the campaign. For `TOLL_FREE` campaigns, it will begin with the prefix
      #  `tf_`, for example: `tf_1234567890`. For `10DLC` campaigns, it will begin with
      #  the prefix `dlc_`, for example: `dlc_1234567890`.
      # @param name [String] Campaign's name.
      # @param type [Pinnacle::Types::MessagingProfileEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::PhoneNumberCampaignDetachPhoneNumbersItemCampaign]
      def initialize(id:, name:, type:, additional_properties: nil)
        @id = id
        @name = name
        @type = type
        @additional_properties = additional_properties
        @_field_set = { "id": id, "name": name, "type": type }
      end

      # Deserialize a JSON object to an instance of
      #  PhoneNumberCampaignDetachPhoneNumbersItemCampaign
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::PhoneNumberCampaignDetachPhoneNumbersItemCampaign]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        name = parsed_json["name"]
        type = parsed_json["type"]
        new(
          id: id,
          name: name,
          type: type,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneNumberCampaignDetachPhoneNumbersItemCampaign to a
      #  JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.type.is_a?(Pinnacle::Types::MessagingProfileEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
