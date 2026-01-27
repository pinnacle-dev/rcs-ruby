# frozen_string_literal: true

module Rcs
  module Types
    # Button that prompts the recipient to share their current location.
    class RcsButtonRequestUserLocation < Internal::Types::Model
      field :metadata, -> { String }, optional: true, nullable: false
      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
