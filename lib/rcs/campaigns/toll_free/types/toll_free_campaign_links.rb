# frozen_string_literal: true

module Rcs
  module Campaigns
    module TollFree
      module Types
        # Legal documentation links.
        class TollFreeCampaignLinks < Internal::Types::Model
          field :privacy_policy, -> { String }, optional: true, nullable: false, api_name: "privacyPolicy"
          field :terms_of_service, -> { String }, optional: true, nullable: false, api_name: "termsOfService"
        end
      end
    end
  end
end
