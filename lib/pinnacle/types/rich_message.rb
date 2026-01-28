# frozen_string_literal: true

module Pinnacle
  module Types
    class RichMessage < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::RichTextMessage }
      member -> { Pinnacle::Types::RichMediaMessage }
      member -> { Pinnacle::Types::RichCardsMessage }
    end
  end
end
