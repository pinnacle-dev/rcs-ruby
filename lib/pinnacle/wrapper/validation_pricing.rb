# frozen_string_literal: true

# Fern Ruby 1.12.1 emits DOUBLE fields as Integer; keep decimal prices intact after regeneration.
Pinnacle::Types::SmsValidationResult.field :unit, -> { Float }
Pinnacle::Types::SmsValidationResponseTotal.field :gsm_7, -> { Float }, api_name: "gsm7"
Pinnacle::Types::SmsValidationResponseTotal.field :utf_16, -> { Float }, api_name: "utf16"
Pinnacle::Types::RcsValidationResult.field :unit, -> { Float }
Pinnacle::Types::RcsValidationResult.field :total, -> { Float }
