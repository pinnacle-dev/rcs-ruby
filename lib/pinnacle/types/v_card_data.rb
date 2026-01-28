# frozen_string_literal: true

module Pinnacle
  module Types
    class VCardData < Internal::Types::Model
      field :file, -> { Pinnacle::Types::VCardDataFile }, optional: false, nullable: false
    end
  end
end
