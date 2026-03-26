# frozen_string_literal: true

module Pinnacle
  module Messages
    module Schedules
      module Types
        class ListScheduledMessagesParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
          field :status, -> { Pinnacle::Messages::Schedules::Types::ListScheduledMessagesRequestStatus }, optional: true, nullable: false
          field :schedule_type, -> { Pinnacle::Messages::Schedules::Types::ListScheduledMessagesRequestScheduleType }, optional: true, nullable: false, api_name: "scheduleType"
          field :content, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
