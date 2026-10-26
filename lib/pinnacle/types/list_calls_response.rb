# frozen_string_literal: true

module Pinnacle
  module Types
    class ListCallsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Pinnacle::Types::Call] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true
    end
  end
end
