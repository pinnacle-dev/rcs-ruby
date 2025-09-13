# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module PhoneNumbers
    module Types
      # Extra search settings to control how many results you get.
      class SearchPhoneNumberOptions
        # @return [Integer] Set the maximum number of phone numbers to return.
        attr_reader :limit
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param limit [Integer] Set the maximum number of phone numbers to return.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Pinnacle::PhoneNumbers::Types::SearchPhoneNumberOptions]
        def initialize(limit: OMIT, additional_properties: nil)
          @limit = limit if limit != OMIT
          @additional_properties = additional_properties
          @_field_set = { "limit": limit }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of SearchPhoneNumberOptions
        #
        # @param json_object [String]
        # @return [Pinnacle::PhoneNumbers::Types::SearchPhoneNumberOptions]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          limit = parsed_json["limit"]
          new(limit: limit, additional_properties: struct)
        end

        # Serialize an instance of SearchPhoneNumberOptions to a JSON object
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
          obj.limit&.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
        end
      end
    end
  end
end
