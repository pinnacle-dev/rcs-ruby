# frozen_string_literal: true

module Rcs
  module Messages
    module Types
      class ReactMessageOptions < Internal::Types::Model
        field :force, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
