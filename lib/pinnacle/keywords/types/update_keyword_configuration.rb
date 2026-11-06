# frozen_string_literal: true

module Pinnacle
  module Keywords
    module Types
      class UpdateKeywordConfiguration < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :categories, -> { Pinnacle::Types::KeywordCategories }, optional: false, nullable: false
      end
    end
  end
end
