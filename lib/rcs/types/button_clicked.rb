# frozen_string_literal: true

module Rcs
  module Types
    class ButtonClicked < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::ButtonClickedData }
      member -> { Rcs::Types::LocationShareAction }
    end
  end
end
