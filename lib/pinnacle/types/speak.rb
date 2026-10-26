# frozen_string_literal: true

module Pinnacle
  module Types
    class Speak < Internal::Types::Model
      field :text, -> { String }, optional: false, nullable: false

      field :voice, -> { String }, optional: true, nullable: false
    end
  end
end
