# frozen_string_literal: true

module Pinnacle
  module Types
    # Simulates when a user presses a `scheduleEvent` button.
    class UserButtonPressScheduleEvent < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false

      field :metadata, -> { String }, optional: true, nullable: false

      field :event_start_time, -> { String }, optional: true, nullable: false, api_name: "eventStartTime"

      field :event_end_time, -> { String }, optional: true, nullable: false, api_name: "eventEndTime"

      field :event_title, -> { String }, optional: true, nullable: false, api_name: "eventTitle"

      field :event_description, -> { String }, optional: true, nullable: false, api_name: "eventDescription"
    end
  end
end
