# frozen_string_literal: true

module Pinnacle
  module Types
    # Location sharing event data received when a user responds to a `requestUserLocation` button and shares their
    # current location.
    #
    # This event contains the geographic coordinates (latitude/longitude) and human-readable address of the location the
    # user chose to share. Use this data to process location-based requests or provide location-specific services.
    class MessageEventRcsLocationData < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :data, -> { Pinnacle::Types::MessageEventRcsLocationDataData }, optional: false, nullable: false
      field :message_id, -> { String }, optional: true, nullable: false, api_name: "messageId"
    end
  end
end
