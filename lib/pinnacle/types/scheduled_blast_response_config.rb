# frozen_string_literal: true

module Pinnacle
  module Types
    # The schedule configuration for the blast.
    class ScheduledBlastResponseConfig < Internal::Types::Model
      field :send_at, -> { String }, optional: true, nullable: false, api_name: "sendAt"
      field :recurrence, -> { String }, optional: true, nullable: false
      field :timezone, -> { String }, optional: true, nullable: false
      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"
    end
  end
end
