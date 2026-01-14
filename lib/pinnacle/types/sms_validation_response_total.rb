# frozen_string_literal: true

module Pinnacle
  module Types
    class SmsValidationResponseTotal < Internal::Types::Model
      field :gsm_7, -> { Integer }, optional: false, nullable: false, api_name: "gsm7"
      field :utf_16, -> { Integer }, optional: false, nullable: false, api_name: "utf16"
    end
  end
end
