# frozen_string_literal: true

module Pinnacle
  module Types
    class ScheduledMessageSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :send_at, -> { String }, optional: false, nullable: true, api_name: "sendAt"
      field :status, -> { Pinnacle::Types::ScheduledMessageSummaryStatus }, optional: false, nullable: false
      field :recurrence, -> { String }, optional: false, nullable: true
      field :timezone, -> { String }, optional: false, nullable: true
      field :end_date, -> { String }, optional: false, nullable: true, api_name: "endDate"
      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
