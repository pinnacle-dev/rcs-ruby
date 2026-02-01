# frozen_string_literal: true

module Pinnacle
  module Types
    # Raw button data. Contains the entire button that was clicked by the user. In rare cases where we cannot determine
    # the exact button, this will return only the button title.
    class MessageEventRcsButtonDataButtonRaw < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::RichButton }
      member -> { String }
    end
  end
end
