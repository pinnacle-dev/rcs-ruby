# frozen_string_literal: true

module Rcs
  module Campaigns
    module TollFree
      module Types
        # Keyword response configuration.
        class TollFreeCampaignKeywords < Internal::Types::Model
          field :help, -> { Rcs::Campaigns::TollFree::Types::TollFreeCampaignHelpKeywords }, optional: true, nullable: false, api_name: "HELP"
          field :opt_in, -> { Rcs::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords }, optional: true, nullable: false, api_name: "OPT_IN"
        end
      end
    end
  end
end
