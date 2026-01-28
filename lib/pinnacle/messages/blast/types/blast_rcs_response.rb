# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blast
      module Types
        class BlastRcsResponse < Internal::Types::Model
          extend Pinnacle::Internal::Types::Union

          member -> { Pinnacle::Types::BlastDetails }
          member -> { Pinnacle::Types::ScheduledBlastDetails }
        end
      end
    end
  end
end
