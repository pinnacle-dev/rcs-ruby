# frozen_string_literal: true

module Pinnacle
  module Types
    class ExtendedBrandWithVetting < Internal::Types::Model
      field :last_tcr_vetting_date, -> { String }, optional: false, nullable: true, api_name: "lastTcrVettingDate"
      field :tcr_feedback, -> { Internal::Types::Array[Pinnacle::Types::VettingFeedback] }, optional: false, nullable: true, api_name: "tcrFeedback"
      field :vetting_history, -> { Internal::Types::Array[Pinnacle::Types::VettingHistory] }, optional: false, nullable: false, api_name: "vettingHistory"
    end
  end
end
