# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaKeywordsHelp < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
      field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
