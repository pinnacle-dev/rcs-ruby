# frozen_string_literal: true

module Pinnacle
  module Types
    # Message with richer content (longer text, media files, cards, and buttons) from interacting with an RCS agent.
    class RcsContent < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::RichText }
      member -> { Pinnacle::Types::RcsMediaContent }
      member -> { Pinnacle::Types::RcsCardsContent }
    end
  end
end
