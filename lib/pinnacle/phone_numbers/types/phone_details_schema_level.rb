# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      module PhoneDetailsSchemaLevel
        extend Pinnacle::Internal::Types::Enum

        BASIC = "basic"
        ADVANCED = "advanced"
      end
    end
  end
end
