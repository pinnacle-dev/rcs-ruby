# frozen_string_literal: true

module Rcs
  module Campaigns
    module Rcs
      module Types
        class RcsAgentPhone < Internal::Types::Model
          field :label, -> { String }, optional: true, nullable: false
          field :phone, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
