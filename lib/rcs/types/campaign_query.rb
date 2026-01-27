# frozen_string_literal: true

module Rcs
  module Types
    # Information about the campaign associated with a conversation
    class CampaignQuery < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { Rcs::Types::CampaignEnum }, optional: false, nullable: false
    end
  end
end
