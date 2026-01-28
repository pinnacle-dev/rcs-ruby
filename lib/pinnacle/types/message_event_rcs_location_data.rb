# frozen_string_literal: true

module Pinnacle
  module Types
    # Location sharing event data received when a user responds to a `requestUserLocation` button and shares their
    # current location.
    #
    # This event contains the geographic coordinates (latitude/longitude) and human-readable address of the location the
    # user chose to share. Use this data to process location-based requests or provide location-specific services.
    class MessageEventRcsLocationData < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
