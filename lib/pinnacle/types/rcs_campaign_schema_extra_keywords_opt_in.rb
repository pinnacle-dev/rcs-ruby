# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaExtraKeywordsOptIn < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
      field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
