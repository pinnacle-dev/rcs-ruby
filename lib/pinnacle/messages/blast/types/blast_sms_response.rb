# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blast
      module Types
        class BlastSmsResponse < Internal::Types::Model
          extend Pinnacle::Internal::Types::Union

          member -> { Pinnacle::Types::BlastDetails }
          member -> { Pinnacle::Types::ScheduledBlastDetails }
        end
      end
    end
  end
end
