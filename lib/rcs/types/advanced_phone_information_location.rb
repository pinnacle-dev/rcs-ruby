# frozen_string_literal: true

module Rcs
  module Types
    # Comprehensive geographic and administrative location data with precise coordinates
    # and timezone information for accurate localization.
    class AdvancedPhoneInformationLocation < Internal::Types::Model
      field :country, -> { Rcs::Types::AdvancedPhoneInformationLocationCountry }, optional: false, nullable: false
      field :city, -> { String }, optional: false, nullable: true
      field :state, -> { String }, optional: false, nullable: true
      field :zip, -> { String }, optional: false, nullable: true
      field :metro_code, -> { String }, optional: false, nullable: true, api_name: "metroCode"
      field :county, -> { String }, optional: false, nullable: true
      field :coordinates, -> { Rcs::Types::AdvancedPhoneInformationLocationCoordinates }, optional: false, nullable: false
      field :time_zone, -> { String }, optional: false, nullable: true, api_name: "timeZone"
    end
  end
end
