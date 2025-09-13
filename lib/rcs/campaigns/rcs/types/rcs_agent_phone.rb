# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsAgentPhone
          # @return [String] Label for the phone number.
          attr_reader :label
          # @return [String] Phone number attached to the agent in E.164 format.
          attr_reader :phone
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param label [String] Label for the phone number.
          # @param phone [String] Phone number attached to the agent in E.164 format.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsAgentPhone]
          def initialize(label: OMIT, phone: OMIT, additional_properties: nil)
            @label = label if label != OMIT
            @phone = phone if phone != OMIT
            @additional_properties = additional_properties
            @_field_set = { "label": label, "phone": phone }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of RcsAgentPhone
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsAgentPhone]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            label = parsed_json["label"]
            phone = parsed_json["phone"]
            new(
              label: label,
              phone: phone,
              additional_properties: struct
            )
          end

          # Serialize an instance of RcsAgentPhone to a JSON object
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
            obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
            obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
