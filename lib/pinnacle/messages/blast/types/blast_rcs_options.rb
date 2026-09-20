# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blast
      module Types
        # Configure how your RCS blast is sent and tracked.
        class BlastRcsOptions < Internal::Types::Model
          field :transcode, -> { Internal::Types::Boolean }, optional: true, nullable: false

          field :validate, -> { Internal::Types::Boolean }, optional: true, nullable: false

          field :standalone_card, -> { Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCard }, optional: true, nullable: false

          field :card_width, -> { Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsCardWidth }, optional: true, nullable: false, api_name: "cardWidth"

          field :schedule, -> { Pinnacle::Types::MessageSchedule }, optional: true, nullable: false
        end
      end
    end
  end
end
