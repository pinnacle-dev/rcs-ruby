# frozen_string_literal: true

module Pinnacle
  module Types
    # Opt-in keyword settings.
    class TollFreeCampaignSchemaKeywordsOptIn < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
      field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
