# frozen_string_literal: true

module Pinnacle
  module Types
    class CallStatusEventCall < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :direction, -> { Pinnacle::Types::CallDirection }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::CallState }, optional: false, nullable: false
    end
  end
end
