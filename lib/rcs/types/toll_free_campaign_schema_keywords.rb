# frozen_string_literal: true

module Rcs
  module Types
    # Keyword response configuration.
    class TollFreeCampaignSchemaKeywords < Internal::Types::Model
      field :help, -> { Rcs::Types::TollFreeCampaignSchemaKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Rcs::Types::TollFreeCampaignSchemaKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
    end
  end
end
