# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSchemaAgentWebsitesItem < Internal::Types::Model
      field :url, -> { String }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
    end
  end
end
