# frozen_string_literal: true

module Pinnacle
  module Types
    class NotFoundErrorBody < Internal::Types::Model
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
