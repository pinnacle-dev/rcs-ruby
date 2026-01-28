# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        # Keyword response configuration.
        class DlcCampaignKeywords < Internal::Types::Model
          field :help, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignHelpKeywords }, optional: true, nullable: false, api_name: "HELP"
          field :opt_in, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignOptInKeywords }, optional: true, nullable: false, api_name: "OPT_IN"
          field :opt_out, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignOptOutKeywords }, optional: true, nullable: false, api_name: "OPT_OUT"
        end
      end
    end
  end
end
