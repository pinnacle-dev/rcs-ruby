# frozen_string_literal: true

module Rcs
  module Types
    class LocationShareAction < Internal::Types::Model
      field :data, -> { Rcs::Types::LocationShareActionData }, optional: false, nullable: false
    end
  end
end
