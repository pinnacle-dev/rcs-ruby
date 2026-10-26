# frozen_string_literal: true

module Pinnacle
  module Types
    class Play < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
