# frozen_string_literal: true

module Rcs
  module Messages
    module Blast
      module Types
        # Additional settings to customize MMS blast delivery.
        class BlastMmsOptions < Internal::Types::Model
          field :validate, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :schedule, -> { Rcs::Types::MessageSchedule }, optional: true, nullable: false
        end
      end
    end
  end
end
