# frozen_string_literal: true

module Rcs
  module Types
    class SubmissionResults < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
