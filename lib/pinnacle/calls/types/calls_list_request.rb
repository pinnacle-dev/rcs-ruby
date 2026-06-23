# frozen_string_literal: true

module Pinnacle
  module Calls
    module Types
      class CallsListRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :state, -> { Pinnacle::Types::CallState }, optional: true, nullable: false

        field :direction, -> { Pinnacle::Types::CallDirection }, optional: true, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :to, -> { String }, optional: true, nullable: false

        field :created_after, -> { String }, optional: true, nullable: false

        field :created_before, -> { String }, optional: true, nullable: false
      end
    end
  end
end
