# frozen_string_literal: true

module Rcs
  module Types
    class RichCardsMessage < Internal::Types::Model
      field :options, -> { Rcs::Types::SendRichCardsOptions }, optional: true, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
    end
  end
end
