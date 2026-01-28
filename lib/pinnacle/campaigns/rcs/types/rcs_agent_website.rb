# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsAgentWebsite < Internal::Types::Model
          field :label, -> { String }, optional: true, nullable: false
          field :url, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
