# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaAgentPhonesItem < Internal::Types::Model
      field :phone, -> { String }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
    end
  end
end
