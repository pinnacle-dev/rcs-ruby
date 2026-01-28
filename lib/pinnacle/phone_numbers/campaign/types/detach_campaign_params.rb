# frozen_string_literal: true

module Pinnacle
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
