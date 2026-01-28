# frozen_string_literal: true

module Pinnacle
  module Types
    # Opt-in keyword settings.
    class DlcWithExtendedBrandAndStatusKeywordsOptIn < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
      field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
