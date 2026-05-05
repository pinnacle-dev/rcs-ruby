# frozen_string_literal: true

module Pinnacle
  module Types
    class FailedSender < Internal::Types::Model
      field :sender, -> { String }, optional: false, nullable: false

      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
