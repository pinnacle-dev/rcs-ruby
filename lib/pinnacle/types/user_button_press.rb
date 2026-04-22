# frozen_string_literal: true

module Pinnacle
  module Types
    # Discriminated union of button presses that can be simulated for a user.
    class UserButtonPress < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      discriminant :type

      member -> { Pinnacle::Types::UserButtonPressTrigger }, key: "TRIGGER"
      member -> { Pinnacle::Types::UserButtonPressOpenUrl }, key: "OPEN_URL"
      member -> { Pinnacle::Types::UserButtonPressCall }, key: "CALL"
      member -> { Pinnacle::Types::UserButtonPressScheduleEvent }, key: "SCHEDULE_EVENT"
      member -> { Pinnacle::Types::UserButtonPressSendLocation }, key: "SEND_LOCATION"
      member -> { Pinnacle::Types::UserButtonPressRequestUserLocation }, key: "REQUEST_USER_LOCATION"
    end
  end
end
