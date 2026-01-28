# frozen_string_literal: true

module Rcs
  module Types
    # Help keyword settings.
    class AutofillDlcResponseKeywordsHelp < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
      field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
