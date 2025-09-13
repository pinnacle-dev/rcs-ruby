# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module PhoneNumbers
    module Types
      # Filter your search by geographic location to find numbers in specific regions.
      #  <br>
      #  Toll-free numbers ignore city and state filters.
      class SearchPhoneNumberByLocation
        # @return [String] Search for numbers in your target city.
        attr_reader :city
        # @return [String] Currently, only US numbers are supported.
        attr_reader :country_code
        # @return [String] Narrow your search to a specific area or exchange code. <br>
        #  For US numbers, this is usually the 3-digit area code.
        attr_reader :national_destination_code
        # @return [String] Search for numbers in your target state or province using a two-letter code.
        attr_reader :state
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param city [String] Search for numbers in your target city.
        # @param country_code [String] Currently, only US numbers are supported.
        # @param national_destination_code [String] Narrow your search to a specific area or exchange code. <br>
        #  For US numbers, this is usually the 3-digit area code.
        # @param state [String] Search for numbers in your target state or province using a two-letter code.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Pinnacle::PhoneNumbers::Types::SearchPhoneNumberByLocation]
        def initialize(city: OMIT, country_code: OMIT, national_destination_code: OMIT, state: OMIT,
                       additional_properties: nil)
          @city = city if city != OMIT
          @country_code = country_code if country_code != OMIT
          @national_destination_code = national_destination_code if national_destination_code != OMIT
          @state = state if state != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "city": city,
            "countryCode": country_code,
            "nationalDestinationCode": national_destination_code,
            "state": state
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of SearchPhoneNumberByLocation
        #
        # @param json_object [String]
        # @return [Pinnacle::PhoneNumbers::Types::SearchPhoneNumberByLocation]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          city = parsed_json["city"]
          country_code = parsed_json["countryCode"]
          national_destination_code = parsed_json["nationalDestinationCode"]
          state = parsed_json["state"]
          new(
            city: city,
            country_code: country_code,
            national_destination_code: national_destination_code,
            state: state,
            additional_properties: struct
          )
        end

        # Serialize an instance of SearchPhoneNumberByLocation to a JSON object
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
          obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
          obj.country_code&.is_a?(String) != false || raise("Passed value for field obj.country_code is not the expected type, validation failed.")
          obj.national_destination_code&.is_a?(String) != false || raise("Passed value for field obj.national_destination_code is not the expected type, validation failed.")
          obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        end
      end
    end
  end
end
