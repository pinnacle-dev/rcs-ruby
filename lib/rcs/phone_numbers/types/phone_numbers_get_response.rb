# frozen_string_literal: true

require "json"
require_relative "../../types/basic_phone_information"
require_relative "../../types/advanced_phone_information"

module Pinnacle
  module PhoneNumbers
    module Types
      class PhoneNumbersGetResponse
        # Deserialize a JSON object to an instance of PhoneNumbersGetResponse
        #
        # @param json_object [String]
        # @return [Pinnacle::PhoneNumbers::Types::PhoneNumbersGetResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          begin
            Pinnacle::Types::BasicPhoneInformation.validate_raw(obj: struct)
            return Pinnacle::Types::BasicPhoneInformation.from_json(json_object: struct) unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          begin
            Pinnacle::Types::AdvancedPhoneInformation.validate_raw(obj: struct)
            return Pinnacle::Types::AdvancedPhoneInformation.from_json(json_object: struct) unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          struct
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given
        #  hash and check each fields type against the current object's property
        #  definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          begin
            return Pinnacle::Types::BasicPhoneInformation.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          begin
            return Pinnacle::Types::AdvancedPhoneInformation.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          raise("Passed value matched no type within the union, validation failed.")
        end
      end
    end
  end
end
