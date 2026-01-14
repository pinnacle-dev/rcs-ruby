# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaExtraKeywords < Internal::Types::Model
      field :help, -> { Pinnacle::Types::RcsCampaignSchemaExtraKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Pinnacle::Types::RcsCampaignSchemaExtraKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Pinnacle::Types::RcsCampaignSchemaExtraKeywordsOptOut }, optional: true, nullable: false, api_name: "OPT_OUT"
    end
  end
end
