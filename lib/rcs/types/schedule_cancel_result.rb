# frozen_string_literal: true

module Rcs
  module Types
    # Response returned when a scheduled message or blast is cancelled.
    class ScheduleCancelResult < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
