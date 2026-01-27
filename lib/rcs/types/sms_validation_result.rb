# frozen_string_literal: true

module Rcs
  module Types
    class SmsValidationResult < Internal::Types::Model
      field :is_over_segment_limit, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isOverSegmentLimit"
      field :segments, -> { Rcs::Types::SmsValidationResponseSegments }, optional: false, nullable: false
      field :total, -> { Rcs::Types::SmsValidationResponseTotal }, optional: false, nullable: false
      field :unit, -> { Integer }, optional: false, nullable: false
    end
  end
end
