# frozen_string_literal: true

module Rcs
  module Types
    class RichButton < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      discriminant :type

      member -> { Rcs::Types::RcsButtonOpenUrl }, key: "OPEN_URL"
      member -> { Rcs::Types::RcsButtonCall }, key: "CALL"
      member -> { Rcs::Types::RcsButtonTrigger }, key: "TRIGGER"
      member -> { Rcs::Types::RcsButtonRequestUserLocation }, key: "REQUEST_USER_LOCATION"
      member -> { Rcs::Types::RcsButtonScheduleEvent }, key: "SCHEDULE_EVENT"
      member -> { Rcs::Types::RcsButtonSendLocation }, key: "SEND_LOCATION"
    end
  end
end
