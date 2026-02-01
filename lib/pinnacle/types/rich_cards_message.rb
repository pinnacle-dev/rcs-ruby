# frozen_string_literal: true

module Pinnacle
  module Types
    class RichCardsMessage < Internal::Types::Model
      field :options, -> { Pinnacle::Types::SendRichCardsOptions }, optional: true, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :fallback, -> { Pinnacle::Types::FallbackMessage }, optional: true, nullable: false
      field :to, -> { String }, optional: false, nullable: false
    end
  end
end
