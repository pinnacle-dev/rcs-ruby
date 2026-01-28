# frozen_string_literal: true

module Rcs
  module Types
    # Response returned when a blast is scheduled for future delivery.
    class ScheduledBlastDetails < Internal::Types::Model
      field :schedule_id, -> { String }, optional: false, nullable: false, api_name: "scheduleId"
      field :config, -> { Rcs::Types::ScheduledBlastResponseConfig }, optional: false, nullable: false
    end
  end
end
