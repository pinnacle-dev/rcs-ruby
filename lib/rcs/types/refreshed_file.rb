# frozen_string_literal: true

module Rcs
  module Types
    class RefreshedFile < Internal::Types::Model
      field :original, -> { String }, optional: false, nullable: false
      field :refreshed, -> { String }, optional: false, nullable: false
    end
  end
end
