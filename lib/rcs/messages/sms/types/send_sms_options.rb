# frozen_string_literal: true

module Rcs
  module Messages
    module Sms
      module Types
        # Additional settings to customize SMS delivery.
        class SendSmsOptions < Internal::Types::Model
          field :schedule, -> { Rcs::Types::MessageSchedule }, optional: true, nullable: false
          field :tracking, -> { Rcs::Types::Tracking }, optional: true, nullable: false
        end
      end
    end
  end
end
