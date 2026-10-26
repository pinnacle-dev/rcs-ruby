# frozen_string_literal: true

module Pinnacle
  module Calls
    module Types
      class CallsListEventsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
