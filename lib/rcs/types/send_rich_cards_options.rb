# frozen_string_literal: true

module Rcs
  module Types
    class SendRichCardsOptions < Internal::Types::Model
      field :standalone_card, -> { Rcs::Types::RichStandaloneCardOptions }, optional: true, nullable: false
    end
  end
end
