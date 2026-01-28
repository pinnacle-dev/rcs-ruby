# frozen_string_literal: true

module Rcs
  module Types
    class RcsCampaignSchemaExtraKeywords < Internal::Types::Model
      field :help, -> { Rcs::Types::RcsCampaignSchemaExtraKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Rcs::Types::RcsCampaignSchemaExtraKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Rcs::Types::RcsCampaignSchemaExtraKeywordsOptOut }, optional: true, nullable: false, api_name: "OPT_OUT"
    end
  end
end
