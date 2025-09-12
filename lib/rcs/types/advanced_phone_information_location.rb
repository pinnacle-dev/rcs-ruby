# frozen_string_literal: true

require_relative "advanced_phone_information_location_country"
require_relative "advanced_phone_information_location_coordinates"
require "ostruct"
require "json"

module Pinnacle
  # Comprehensive geographic and administrative location data with precise
  #  coordinates
  #  and timezone information for accurate localization.
  class AdvancedPhoneInformationLocation
    # @return [Pinnacle::AdvancedPhoneInformationLocationCountry] Complete country identification and metadata.
    attr_reader :country
    # @return [String] Primary city or municipality associated with the phone number.
    attr_reader :city
    # @return [String] State, province, or primary administrative division code.
    #  Uses standard 2-letter abbreviations where applicable.
    attr_reader :state
    # @return [String] Postal or ZIP code for the phone number's registered location.
    attr_reader :zip
    # @return [String] Primary Metropolitan Statistical Area (PMSA) code for US numbers.
    #  Used for demographic and market analysis purposes.
    attr_reader :metro_code
    # @return [String] County or secondary administrative division name.
    attr_reader :county
    # @return [Pinnacle::AdvancedPhoneInformationLocationCoordinates] Coordinates provide the precise latitude and longitude values for the phone
    #  number’s registered location.
    attr_reader :coordinates
    # @return [String] IANA timezone identifier for the number’s location.
    attr_reader :time_zone
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param country [Pinnacle::AdvancedPhoneInformationLocationCountry] Complete country identification and metadata.
    # @param city [String] Primary city or municipality associated with the phone number.
    # @param state [String] State, province, or primary administrative division code.
    #  Uses standard 2-letter abbreviations where applicable.
    # @param zip [String] Postal or ZIP code for the phone number's registered location.
    # @param metro_code [String] Primary Metropolitan Statistical Area (PMSA) code for US numbers.
    #  Used for demographic and market analysis purposes.
    # @param county [String] County or secondary administrative division name.
    # @param coordinates [Pinnacle::AdvancedPhoneInformationLocationCoordinates] Coordinates provide the precise latitude and longitude values for the phone
    #  number’s registered location.
    # @param time_zone [String] IANA timezone identifier for the number’s location.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::AdvancedPhoneInformationLocation]
    def initialize(country:, coordinates:, city: OMIT, state: OMIT, zip: OMIT, metro_code: OMIT, county: OMIT,
                   time_zone: OMIT, additional_properties: nil)
      @country = country
      @city = city if city != OMIT
      @state = state if state != OMIT
      @zip = zip if zip != OMIT
      @metro_code = metro_code if metro_code != OMIT
      @county = county if county != OMIT
      @coordinates = coordinates
      @time_zone = time_zone if time_zone != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "country": country,
        "city": city,
        "state": state,
        "zip": zip,
        "metroCode": metro_code,
        "county": county,
        "coordinates": coordinates,
        "timeZone": time_zone
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AdvancedPhoneInformationLocation
    #
    # @param json_object [String]
    # @return [Pinnacle::AdvancedPhoneInformationLocation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["country"].nil?
        country = nil
      else
        country = parsed_json["country"].to_json
        country = Pinnacle::AdvancedPhoneInformationLocationCountry.from_json(json_object: country)
      end
      city = parsed_json["city"]
      state = parsed_json["state"]
      zip = parsed_json["zip"]
      metro_code = parsed_json["metroCode"]
      county = parsed_json["county"]
      if parsed_json["coordinates"].nil?
        coordinates = nil
      else
        coordinates = parsed_json["coordinates"].to_json
        coordinates = Pinnacle::AdvancedPhoneInformationLocationCoordinates.from_json(json_object: coordinates)
      end
      time_zone = parsed_json["timeZone"]
      new(
        country: country,
        city: city,
        state: state,
        zip: zip,
        metro_code: metro_code,
        county: county,
        coordinates: coordinates,
        time_zone: time_zone,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdvancedPhoneInformationLocation to a JSON object
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
      Pinnacle::AdvancedPhoneInformationLocationCountry.validate_raw(obj: obj.country)
      obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.zip&.is_a?(String) != false || raise("Passed value for field obj.zip is not the expected type, validation failed.")
      obj.metro_code&.is_a?(String) != false || raise("Passed value for field obj.metro_code is not the expected type, validation failed.")
      obj.county&.is_a?(String) != false || raise("Passed value for field obj.county is not the expected type, validation failed.")
      Pinnacle::AdvancedPhoneInformationLocationCoordinates.validate_raw(obj: obj.coordinates)
      obj.time_zone&.is_a?(String) != false || raise("Passed value for field obj.time_zone is not the expected type, validation failed.")
    end
  end
end
