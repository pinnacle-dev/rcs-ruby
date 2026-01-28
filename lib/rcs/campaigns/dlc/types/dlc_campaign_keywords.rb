# frozen_string_literal: true

module Rcs
  module Campaigns
    module Dlc
      module Types
        # Keyword response configuration.
        class DlcCampaignKeywords < Internal::Types::Model
          field :help, -> { Rcs::Campaigns::Dlc::Types::DlcCampaignHelpKeywords }, optional: true, nullable: false, api_name: "HELP"
          field :opt_in, -> { Rcs::Campaigns::Dlc::Types::DlcCampaignOptInKeywords }, optional: true, nullable: false, api_name: "OPT_IN"
          field :opt_out, -> { Rcs::Campaigns::Dlc::Types::DlcCampaignOptOutKeywords }, optional: true, nullable: false, api_name: "OPT_OUT"
        end
      end
    end
  end
end
