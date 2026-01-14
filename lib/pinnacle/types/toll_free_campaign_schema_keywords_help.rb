# frozen_string_literal: true

module Pinnacle
  module Types
    # Help keyword settings.
    class TollFreeCampaignSchemaKeywordsHelp < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
