# frozen_string_literal: true

module Pinnacle
  module Types
    # Configuration for the scheduled message.
    class ScheduledSendResponseConfig < Internal::Types::Model
      field :send_at, -> { String }, optional: false, nullable: false, api_name: "sendAt"
      field :recurrence, -> { String }, optional: true, nullable: false
      field :timezone, -> { String }, optional: false, nullable: false
      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"
    end
  end
end
