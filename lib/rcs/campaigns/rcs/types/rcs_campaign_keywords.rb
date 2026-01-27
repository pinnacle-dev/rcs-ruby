# frozen_string_literal: true

module Rcs
  module Campaigns
    module Rcs
      module Types
        class RcsCampaignKeywords < Internal::Types::Model
          field :help, -> { Rcs::Campaigns::Rcs::Types::RcsCampaignHelpKeywords }, optional: true, nullable: false, api_name: "HELP"
          field :opt_in, -> { Rcs::Campaigns::Rcs::Types::RcsCampaignOptInKeywords }, optional: true, nullable: false, api_name: "OPT_IN"
          field :opt_out, -> { Rcs::Campaigns::Rcs::Types::RcsCampaignOptOutKeywords }, optional: true, nullable: false, api_name: "OPT_OUT"
        end
      end
    end
  end
end
