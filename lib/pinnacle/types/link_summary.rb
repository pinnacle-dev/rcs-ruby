# frozen_string_literal: true

module Pinnacle
  module Types
    class LinkSummary < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
