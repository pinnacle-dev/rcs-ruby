# frozen_string_literal: true

module Pinnacle
  module Types
    class ButtonClicked < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::ButtonClickedData }
      member -> { Pinnacle::Types::LocationShareAction }
    end
  end
end
