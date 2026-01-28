# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Types
      # Additional information to tailor lookup.
      class EnhancedContactInfo < Internal::Types::Model
        field :context, -> { String }, optional: true, nullable: false
      end
    end
  end
end
