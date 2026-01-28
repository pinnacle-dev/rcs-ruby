# frozen_string_literal: true

module Pinnacle
  module Types
    class CreateUrlOptions < Internal::Types::Model
      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
    end
  end
end
