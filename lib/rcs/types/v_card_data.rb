# frozen_string_literal: true

module Rcs
  module Types
    class VCardData < Internal::Types::Model
      field :file, -> { Rcs::Types::VCardDataFile }, optional: false, nullable: false
    end
  end
end
