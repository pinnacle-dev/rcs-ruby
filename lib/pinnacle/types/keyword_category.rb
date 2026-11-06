# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordCategory < Internal::Types::Model
      field :keywords, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :response, -> { String }, optional: false, nullable: false
    end
  end
end
