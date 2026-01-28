# frozen_string_literal: true

module Pinnacle
  module Types
    # Details about how the MMS content would be segmented for delivery.
    class MmsValidationResponseSegments < Internal::Types::Model
      field :count, -> { Integer }, optional: false, nullable: false
      field :unsupported_files, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "unsupportedFiles"
      field :value, -> { Internal::Types::Array[Pinnacle::Types::MmsValidationResponseSegmentsValueItem] }, optional: false, nullable: false
    end
  end
end
