# frozen_string_literal: true

module Pinnacle
  module Types
    # The RCS agent the campaign-status update is for.
    class CampaignStatusEventAgent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
