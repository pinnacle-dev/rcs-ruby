# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        # Keyword response configuration.
        class TollFreeCampaignKeywords < Internal::Types::Model
          field :help, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignHelpKeywords }, optional: true, nullable: false, api_name: "HELP"
          field :opt_in, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords }, optional: true, nullable: false, api_name: "OPT_IN"
        end
      end
    end
  end
end
