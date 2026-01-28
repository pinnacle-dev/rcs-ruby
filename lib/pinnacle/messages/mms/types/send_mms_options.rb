# frozen_string_literal: true

module Pinnacle
  module Messages
    module Mms
      module Types
        # Control how your MMS is processed and delivered.
        class SendMmsOptions < Internal::Types::Model
          field :multiple_messages, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :schedule, -> { Pinnacle::Types::MessageSchedule }, optional: true, nullable: false
          field :tracking, -> { Pinnacle::Types::Tracking }, optional: true, nullable: false
          field :validate, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
