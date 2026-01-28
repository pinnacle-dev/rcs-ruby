# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blast
      module Types
        # Additional settings to customize SMS blast delivery.
        class BlastSmsOptions < Internal::Types::Model
          field :schedule, -> { Pinnacle::Types::MessageSchedule }, optional: true, nullable: false
        end
      end
    end
  end
end
