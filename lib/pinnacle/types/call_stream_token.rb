# frozen_string_literal: true

module Pinnacle
  module Types
    class CallStreamToken < Internal::Types::Model
      field :token, -> { String }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: false

      field :stream_url, -> { String }, optional: false, nullable: false
    end
  end
end
