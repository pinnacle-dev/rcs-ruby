# frozen_string_literal: true

module Rcs
  module Types
    class PinnacleUrlConfig < Internal::Types::Model
      field :to, -> { String }, optional: false, nullable: false
      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"
    end
  end
end
