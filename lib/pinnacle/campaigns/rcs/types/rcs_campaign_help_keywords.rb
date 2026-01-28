# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsCampaignHelpKeywords < Internal::Types::Model
          field :message, -> { String }, optional: true, nullable: false
          field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
