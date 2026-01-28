# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsValidateContent < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::RichText }
      member -> { Pinnacle::Types::RcsValidateContentMedia }
      member -> { Pinnacle::Types::RichCards }
    end
  end
end
