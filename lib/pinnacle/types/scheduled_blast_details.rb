# frozen_string_literal: true

module Pinnacle
  module Types
    # Response returned when a blast is scheduled for future delivery.
    class ScheduledBlastDetails < Internal::Types::Model
      field :schedule_id, -> { String }, optional: false, nullable: false, api_name: "scheduleId"
      field :config, -> { Pinnacle::Types::ScheduledBlastResponseConfig }, optional: false, nullable: false
    end
  end
end
