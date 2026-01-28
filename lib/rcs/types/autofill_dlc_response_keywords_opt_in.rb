# frozen_string_literal: true

module Rcs
  module Types
    # Opt-in keyword settings.
    class AutofillDlcResponseKeywordsOptIn < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
      field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
