# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        class TollFreeAutofillResponse < Internal::Types::Model
          field :brand, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
