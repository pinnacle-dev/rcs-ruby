# frozen_string_literal: true

module Pinnacle
  module Types
    class NetworkRequestSummary < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :type, -> { Pinnacle::Types::NetworkRequestType }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::NetworkRequestStatus }, optional: false, nullable: false

      field :client_ref, -> { String }, optional: false, nullable: true, api_name: "clientRef"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :completed_at, -> { String }, optional: false, nullable: true, api_name: "completedAt"

      field :expires_at, -> { String }, optional: false, nullable: true, api_name: "expiresAt"

      field :error_message, -> { String }, optional: false, nullable: true, api_name: "errorMessage"

      field :result, -> { Pinnacle::Types::NetworkRequestResult }, optional: false, nullable: true
    end
  end
end
