# frozen_string_literal: true

module Rcs
  module Types
    # Raw button data. Contains the entire button that was clicked by the user. In rare cases where we cannot determine
    # the exact button, this will return only the button title.
    class ButtonClickedDataButtonRaw < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::RichButton }
      member -> { String }
    end
  end
end
