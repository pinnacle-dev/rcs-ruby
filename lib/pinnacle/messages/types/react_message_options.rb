# frozen_string_literal: true

module Pinnacle
  module Messages
    module Types
      class ReactMessageOptions < Internal::Types::Model
        field :force, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
