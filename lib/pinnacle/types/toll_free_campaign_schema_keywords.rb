# frozen_string_literal: true

module Pinnacle
  module Types
    # Keyword response configuration.
    class TollFreeCampaignSchemaKeywords < Internal::Types::Model
      field :help, -> { Pinnacle::Types::TollFreeCampaignSchemaKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Pinnacle::Types::TollFreeCampaignSchemaKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
    end
  end
end
