# frozen_string_literal: true

module Pinnacle
  module Types
    class RichButton < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      discriminant :type

      member -> { Pinnacle::Types::RcsButtonOpenUrl }, key: "OPEN_URL"
      member -> { Pinnacle::Types::RcsButtonCall }, key: "CALL"
      member -> { Pinnacle::Types::RcsButtonTrigger }, key: "TRIGGER"
      member -> { Pinnacle::Types::RcsButtonRequestUserLocation }, key: "REQUEST_USER_LOCATION"
      member -> { Pinnacle::Types::RcsButtonScheduleEvent }, key: "SCHEDULE_EVENT"
      member -> { Pinnacle::Types::RcsButtonSendLocation }, key: "SEND_LOCATION"
    end
  end
end
