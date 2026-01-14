# frozen_string_literal: true

module Pinnacle
  module Types
    class SmsValidationResult < Internal::Types::Model
      field :is_over_segment_limit, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isOverSegmentLimit"
      field :segments, -> { Pinnacle::Types::SmsValidationResponseSegments }, optional: false, nullable: false
      field :total, -> { Pinnacle::Types::SmsValidationResponseTotal }, optional: false, nullable: false
      field :unit, -> { Integer }, optional: false, nullable: false
    end
  end
end
