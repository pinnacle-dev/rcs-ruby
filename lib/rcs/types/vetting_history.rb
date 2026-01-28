# frozen_string_literal: true

module Rcs
  module Types
    class VettingHistory < Internal::Types::Model
      field :provider, -> { String }, optional: false, nullable: false
      field :vetting_class, -> { String }, optional: false, nullable: false, api_name: "vettingClass"
      field :vetting_date, -> { String }, optional: false, nullable: false, api_name: "vettingDate"
      field :vetting_score, -> { Integer }, optional: true, nullable: false, api_name: "vettingScore"
      field :vetting_status, -> { Rcs::Types::VettingHistoryVettingStatus }, optional: false, nullable: false, api_name: "vettingStatus"
    end
  end
end
