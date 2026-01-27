# frozen_string_literal: true

module Rcs
  module Messages
    module Blast
      module Types
        # Configure how your RCS blast is sent and tracked.
        class BlastRcsOptions < Internal::Types::Model
          field :transcode, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :validate, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :standalone_card, -> { Rcs::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCard }, optional: true, nullable: false
          field :schedule, -> { Rcs::Types::MessageSchedule }, optional: true, nullable: false
        end
      end
    end
  end
end
