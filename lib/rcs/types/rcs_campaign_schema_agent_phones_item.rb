# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class RcsCampaignSchemaAgentPhonesItem
      # @return [String] Phone number attached to the agent in E.164 format.
      attr_reader :phone
      # @return [String] Label for the phone number.
      attr_reader :label
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param phone [String] Phone number attached to the agent in E.164 format.
      # @param label [String] Label for the phone number.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCampaignSchemaAgentPhonesItem]
      def initialize(phone: OMIT, label: OMIT, additional_properties: nil)
        @phone = phone if phone != OMIT
        @label = label if label != OMIT
        @additional_properties = additional_properties
        @_field_set = { "phone": phone, "label": label }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCampaignSchemaAgentPhonesItem
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCampaignSchemaAgentPhonesItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        phone = parsed_json["phone"]
        label = parsed_json["label"]
        new(
          phone: phone,
          label: label,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCampaignSchemaAgentPhonesItem to a JSON object
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
        obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
        obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      end
    end
  end
end
