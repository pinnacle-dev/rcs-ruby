# frozen_string_literal: true

module Pinnacle
  module Types
    class HostedSilentAuthResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :browser_url, -> { String }, optional: false, nullable: false, api_name: "browserUrl"

      field :expires_at, -> { String }, optional: false, nullable: false, api_name: "expiresAt"
    end
  end
end
