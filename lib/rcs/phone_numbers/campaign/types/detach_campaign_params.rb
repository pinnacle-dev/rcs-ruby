# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Campaign
      module Types
        class DetachCampaignParams < Internal::Types::Model
          field :phones, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
