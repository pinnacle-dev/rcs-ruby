# frozen_string_literal: true

module Rcs
  module Types
    class RichMessage < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::RichTextMessage }
      member -> { Rcs::Types::RichMediaMessage }
      member -> { Rcs::Types::RichCardsMessage }
    end
  end
end
