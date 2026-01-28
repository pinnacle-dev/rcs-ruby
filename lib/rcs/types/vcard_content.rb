# frozen_string_literal: true

module Rcs
  module Types
    class VcardContent < Internal::Types::Model
      field :revision, -> { String }, optional: true, nullable: false
    end
  end
end
