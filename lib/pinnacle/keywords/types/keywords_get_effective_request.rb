# frozen_string_literal: true

module Pinnacle
  module Keywords
    module Types
      class KeywordsGetEffectiveRequest < Internal::Types::Model
        field :sender, -> { String }, optional: false, nullable: false
      end
    end
  end
end
