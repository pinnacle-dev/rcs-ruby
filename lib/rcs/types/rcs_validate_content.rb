# frozen_string_literal: true

module Rcs
  module Types
    class RcsValidateContent < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::RichText }
      member -> { Rcs::Types::RcsValidateContentMedia }
      member -> { Rcs::Types::RichCards }
    end
  end
end
