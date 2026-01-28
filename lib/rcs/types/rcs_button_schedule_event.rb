# frozen_string_literal: true

module Rcs
  module Types
    # Button that prompts the recipient to add an event to their calendar.
    class RcsButtonScheduleEvent < Internal::Types::Model
      field :event_description, -> { String }, optional: true, nullable: false, api_name: "eventDescription"
      field :event_end_time, -> { String }, optional: false, nullable: false, api_name: "eventEndTime"
      field :event_start_time, -> { String }, optional: false, nullable: false, api_name: "eventStartTime"
      field :event_title, -> { String }, optional: false, nullable: false, api_name: "eventTitle"
      field :metadata, -> { String }, optional: true, nullable: false
      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
