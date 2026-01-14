# frozen_string_literal: true

module Pinnacle
  module Types
    # Segmentation details when your message is encoded with UTF-16.
    class SmsValidationResponseSegmentsUtf16 < Internal::Types::Model
      field :total_bytes, -> { Integer }, optional: false, nullable: false, api_name: "totalBytes"
      field :value, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
