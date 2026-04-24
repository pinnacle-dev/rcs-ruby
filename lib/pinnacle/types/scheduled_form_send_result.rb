# frozen_string_literal: true

module Pinnacle
  module Types
    # Response shape for a scheduled form send — returned in place of `SendFormResponse` when `options.schedule` is set.
    class ScheduledFormSendResult < Internal::Types::Model
      field :schedule_id, -> { String }, optional: false, nullable: false, api_name: "scheduleId"
      field :config, -> { Pinnacle::Types::MessageSchedule }, optional: false, nullable: false
      field :form, -> { Pinnacle::Types::ScheduledFormSendResponseForm }, optional: false, nullable: false
      field :submission, -> { Pinnacle::Types::ScheduledFormSendResponseSubmission }, optional: false, nullable: false
    end
  end
end
