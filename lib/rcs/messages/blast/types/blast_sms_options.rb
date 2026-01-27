# frozen_string_literal: true

module Rcs
  module Messages
    module Blast
      module Types
        # Additional settings to customize SMS blast delivery.
        class BlastSmsOptions < Internal::Types::Model
          field :schedule, -> { Rcs::Types::MessageSchedule }, optional: true, nullable: false
        end
      end
    end
  end
end
