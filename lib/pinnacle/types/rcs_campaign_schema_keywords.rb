# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaKeywords < Internal::Types::Model
      field :help, -> { Pinnacle::Types::RcsCampaignSchemaKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Pinnacle::Types::RcsCampaignSchemaKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Pinnacle::Types::RcsCampaignSchemaKeywordsOptOut }, optional: true, nullable: false, api_name: "OPT_OUT"
    end
  end
end
