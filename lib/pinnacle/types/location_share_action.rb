# frozen_string_literal: true

module Pinnacle
  module Types
    class LocationShareAction < Internal::Types::Model
      field :data, -> { Pinnacle::Types::LocationShareActionData }, optional: false, nullable: false
    end
  end
end
