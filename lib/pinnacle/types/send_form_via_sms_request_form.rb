# frozen_string_literal: true

module Pinnacle
  module Types
    class SendFormViaSmsRequestForm < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { String }
      member -> { Pinnacle::Types::FormDefinition }
    end
  end
end
