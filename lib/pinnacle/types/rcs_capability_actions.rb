# frozen_string_literal: true

module Pinnacle
  module Types
    # Supported button action types inside the rich cards or quick replies. Each key is a button action type that
    # defines a specific button type in the Pinnacle API.
    class RcsCapabilityActions < Internal::Types::Model
      field :open_url, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "openUrl"
      field :call, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :trigger, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :request_user_location, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "requestUserLocation"
      field :schedule_event, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "scheduleEvent"
      field :send_location, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "sendLocation"
    end
  end
end
