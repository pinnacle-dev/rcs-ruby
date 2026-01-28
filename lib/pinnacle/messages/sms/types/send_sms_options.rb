# frozen_string_literal: true

module Pinnacle
  module Messages
    module Sms
      module Types
        # Additional settings to customize SMS delivery.
        class SendSmsOptions < Internal::Types::Model
          field :schedule, -> { Pinnacle::Types::MessageSchedule }, optional: true, nullable: false
          field :tracking, -> { Pinnacle::Types::Tracking }, optional: true, nullable: false
        end
      end
    end
  end
end
