# frozen_string_literal: true

module Pinnacle
  module Types
    # Configure how your RCS message is sent and tracked.
    class SendRichCardsOptions < Internal::Types::Model
      field :schedule, -> { Pinnacle::Types::MessageSchedule }, optional: true, nullable: false

      field :tracking, -> { Pinnacle::Types::Tracking }, optional: true, nullable: false

      field :transcode, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :validate, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :standalone_card, -> { Pinnacle::Types::RichStandaloneCardOptions }, optional: true, nullable: false
    end
  end
end
