# frozen_string_literal: true

module Rcs
  module Types
    class RcsCampaignSchemaKeywords < Internal::Types::Model
      field :help, -> { Rcs::Types::RcsCampaignSchemaKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Rcs::Types::RcsCampaignSchemaKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Rcs::Types::RcsCampaignSchemaKeywordsOptOut }, optional: true, nullable: false, api_name: "OPT_OUT"
    end
  end
end
