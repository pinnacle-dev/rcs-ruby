# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsAutofillResponse < Internal::Types::Model
          field :brand, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
