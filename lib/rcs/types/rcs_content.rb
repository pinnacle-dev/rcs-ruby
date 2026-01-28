# frozen_string_literal: true

module Rcs
  module Types
    # Message with richer content (longer text, media files, cards, and buttons) from interacting with an RCS agent.
    class RcsContent < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::RichText }
      member -> { Rcs::Types::RcsMediaContent }
      member -> { Rcs::Types::RcsCardsContent }
    end
  end
end
