# frozen_string_literal: true

module Pinnacle
  module Types
    # Define when and how your message should be sent.
    class MessageSchedule < Internal::Types::Model
      field :send_at, -> { String }, optional: false, nullable: false, api_name: "sendAt"
      field :recurrence, -> { String }, optional: true, nullable: false
      field :timezone, -> { String }, optional: true, nullable: false
      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"
    end
  end
end
