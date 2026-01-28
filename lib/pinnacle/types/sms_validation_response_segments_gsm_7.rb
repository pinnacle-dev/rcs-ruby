# frozen_string_literal: true

module Pinnacle
  module Types
    # Segmentation details when your message is encoded with GSM-7.
    class SmsValidationResponseSegmentsGsm7 < Internal::Types::Model
      field :total_bytes, -> { Integer }, optional: false, nullable: false, api_name: "totalBytes"
      field :unsupported, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :value, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
