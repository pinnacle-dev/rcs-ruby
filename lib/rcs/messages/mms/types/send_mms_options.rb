# frozen_string_literal: true

module Rcs
  module Messages
    module Mms
      module Types
        # Control how your MMS is processed and delivered.
        class SendMmsOptions < Internal::Types::Model
          field :multiple_messages, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :schedule, -> { Rcs::Types::MessageSchedule }, optional: true, nullable: false
          field :tracking, -> { Rcs::Types::Tracking }, optional: true, nullable: false
          field :validate, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
