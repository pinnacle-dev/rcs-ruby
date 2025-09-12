# frozen_string_literal: true

require_relative "phone_details_schema_options_enhanced_contact_info"
require "ostruct"
require "json"

module Pinnacle
  class PhoneNumbers
    # Customize your lookup with additional options.
    class PhoneDetailsSchemaOptions
      # @return [Boolean] Allows you to force a fresh lookup from primary sources instead of cached data.
      #  <br>
      #  Fresh lookups will take longer to complete than cached lookups.
      attr_reader :force
      # @return [Boolean] Include a fraud risk and security analysis.
      attr_reader :risk
      # @return [Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptionsEnhancedContactInfo] Additional information to tailor lookup.
      attr_reader :enhanced_contact_info
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param force [Boolean] Allows you to force a fresh lookup from primary sources instead of cached data.
      #  <br>
      #  Fresh lookups will take longer to complete than cached lookups.
      # @param risk [Boolean] Include a fraud risk and security analysis.
      # @param enhanced_contact_info [Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptionsEnhancedContactInfo] Additional information to tailor lookup.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptions]
      def initialize(force: OMIT, risk: OMIT, enhanced_contact_info: OMIT, additional_properties: nil)
        @force = force if force != OMIT
        @risk = risk if risk != OMIT
        @enhanced_contact_info = enhanced_contact_info if enhanced_contact_info != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "force": force,
          "risk": risk,
          "enhanced_contact_info": enhanced_contact_info
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PhoneDetailsSchemaOptions
      #
      # @param json_object [String]
      # @return [Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        force = parsed_json["force"]
        risk = parsed_json["risk"]
        if parsed_json["enhanced_contact_info"].nil?
          enhanced_contact_info = nil
        else
          enhanced_contact_info = parsed_json["enhanced_contact_info"].to_json
          enhanced_contact_info = Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptionsEnhancedContactInfo.from_json(json_object: enhanced_contact_info)
        end
        new(
          force: force,
          risk: risk,
          enhanced_contact_info: enhanced_contact_info,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneDetailsSchemaOptions to a JSON object
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
        obj.force&.is_a?(Boolean) != false || raise("Passed value for field obj.force is not the expected type, validation failed.")
        obj.risk&.is_a?(Boolean) != false || raise("Passed value for field obj.risk is not the expected type, validation failed.")
        obj.enhanced_contact_info.nil? || Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptionsEnhancedContactInfo.validate_raw(obj: obj.enhanced_contact_info)
      end
    end
  end
end
