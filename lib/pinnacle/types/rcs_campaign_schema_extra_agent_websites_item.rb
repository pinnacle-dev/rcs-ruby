# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaExtraAgentWebsitesItem < Internal::Types::Model
      field :label, -> { String }, optional: true, nullable: false
      field :url, -> { String }, optional: true, nullable: false
    end
  end
end
