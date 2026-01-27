# frozen_string_literal: true

module Rcs
  module Types
    # Configure how your RCS message is sent and tracked.
    class SendRichMessageOptions < Internal::Types::Model
      field :schedule, -> { Rcs::Types::MessageSchedule }, optional: true, nullable: false
      field :test_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tracking, -> { Rcs::Types::Tracking }, optional: true, nullable: false
      field :transcode, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :validate, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
