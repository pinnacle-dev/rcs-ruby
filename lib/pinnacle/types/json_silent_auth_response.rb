# frozen_string_literal: true

module Pinnacle
  module Types
    class JsonSilentAuthResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :json_url, -> { String }, optional: false, nullable: false, api_name: "jsonUrl"

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"
    end
  end
end
