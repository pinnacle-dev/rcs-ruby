# frozen_string_literal: true

module Pinnacle
  module Types
    class SendRichCardsOptions < Internal::Types::Model
      field :standalone_card, -> { Pinnacle::Types::RichStandaloneCardOptions }, optional: true, nullable: false
    end
  end
end
