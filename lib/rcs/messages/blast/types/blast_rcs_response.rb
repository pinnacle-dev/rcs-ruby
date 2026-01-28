# frozen_string_literal: true

module Rcs
  module Messages
    module Blast
      module Types
        class BlastRcsResponse < Internal::Types::Model
          extend Rcs::Internal::Types::Union

          member -> { Rcs::Types::BlastDetails }
          member -> { Rcs::Types::ScheduledBlastDetails }
        end
      end
    end
  end
end
