# frozen_string_literal: true

module Rcs
  module Types
    # Details about how the SMS content would be segmented for delivery.
    class SmsValidationResponseSegments < Internal::Types::Model
      field :gsm_7, -> { Rcs::Types::SmsValidationResponseSegmentsGsm7 }, optional: false, nullable: false, api_name: "gsm7"
      field :utf_16, -> { Rcs::Types::SmsValidationResponseSegmentsUtf16 }, optional: false, nullable: false, api_name: "utf16"
    end
  end
end
