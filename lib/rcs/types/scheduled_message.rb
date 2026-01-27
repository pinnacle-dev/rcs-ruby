# frozen_string_literal: true

module Rcs
  module Types
    class ScheduledMessage < Internal::Types::Model
      field :schedule_id, -> { String }, optional: false, nullable: false, api_name: "scheduleId"
      field :config, -> { Rcs::Types::ScheduledSendResponseConfig }, optional: false, nullable: false
    end
  end
end
