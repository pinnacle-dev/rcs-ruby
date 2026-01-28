# frozen_string_literal: true

module Pinnacle
  module Types
    # Information about the campaign associated with a conversation
    class CampaignQuery < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { Pinnacle::Types::CampaignEnum }, optional: false, nullable: false
    end
  end
end
