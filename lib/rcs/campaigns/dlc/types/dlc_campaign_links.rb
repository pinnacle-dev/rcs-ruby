# frozen_string_literal: true

module Rcs
  module Campaigns
    module Dlc
      module Types
        # Legal documentation links.
        class DlcCampaignLinks < Internal::Types::Model
          field :privacy_policy, -> { String }, optional: true, nullable: false, api_name: "privacyPolicy"
          field :terms_of_service, -> { String }, optional: true, nullable: false, api_name: "termsOfService"
        end
      end
    end
  end
end
