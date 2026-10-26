# frozen_string_literal: true

module Pinnacle
  module Calls
    module Types
      class UpdateCallParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false
      end
    end
  end
end
