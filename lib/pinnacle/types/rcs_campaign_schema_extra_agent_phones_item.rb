# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaExtraAgentPhonesItem < Internal::Types::Model
      field :label, -> { String }, optional: true, nullable: false
      field :phone, -> { String }, optional: true, nullable: false
    end
  end
end
