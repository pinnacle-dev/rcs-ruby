# frozen_string_literal: true

module Rcs
  module Types
    class RcsCampaignSchemaAgentEmailsItem < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
    end
  end
end
