# frozen_string_literal: true

require_relative "messaging_profile_enum"
require "ostruct"
require "json"

module Pinnacle
  # Campaign that the phone is now attached to.
  class PhoneNumberCampaignAttachPhoneNumbersItemCampaign
    # @return [Integer] Id of the campaign.
    attr_reader :id
    # @return [String] Campaign's name.
    attr_reader :name
    # @return [Pinnacle::MessagingProfileEnum]
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [Integer] Id of the campaign.
    # @param name [String] Campaign's name.
    # @param type [Pinnacle::MessagingProfileEnum]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PhoneNumberCampaignAttachPhoneNumbersItemCampaign]
    def initialize(id:, name:, type:, additional_properties: nil)
      @id = id
      @name = name
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "type": type }
    end

    # Deserialize a JSON object to an instance of
    #  PhoneNumberCampaignAttachPhoneNumbersItemCampaign
    #
    # @param json_object [String]
    # @return [Pinnacle::PhoneNumberCampaignAttachPhoneNumbersItemCampaign]
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

    # Serialize an instance of PhoneNumberCampaignAttachPhoneNumbersItemCampaign to a
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
      obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type.is_a?(Pinnacle::MessagingProfileEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
