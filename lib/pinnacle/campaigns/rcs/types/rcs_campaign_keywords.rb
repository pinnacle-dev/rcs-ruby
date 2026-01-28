# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsCampaignKeywords < Internal::Types::Model
          field :help, -> { Pinnacle::Campaigns::Rcs::Types::RcsCampaignHelpKeywords }, optional: true, nullable: false, api_name: "HELP"
          field :opt_in, -> { Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptInKeywords }, optional: true, nullable: false, api_name: "OPT_IN"
          field :opt_out, -> { Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptOutKeywords }, optional: true, nullable: false, api_name: "OPT_OUT"
        end
      end
    end
  end
end
