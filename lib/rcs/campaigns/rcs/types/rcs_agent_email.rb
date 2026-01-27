# frozen_string_literal: true

module Rcs
  module Campaigns
    module Rcs
      module Types
        class RcsAgentEmail < Internal::Types::Model
          field :email, -> { String }, optional: true, nullable: false
          field :label, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
