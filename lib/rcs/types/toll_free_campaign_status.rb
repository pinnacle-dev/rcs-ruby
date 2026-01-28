# frozen_string_literal: true

module Rcs
  module Types
    # Response for get toll-free campaign status.
    class TollFreeCampaignStatus < Internal::Types::Model
      field :error, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :updates, -> { Rcs::Types::GetTollFreeCampaignStatusResponseUpdates }, optional: false, nullable: false
    end
  end
end
