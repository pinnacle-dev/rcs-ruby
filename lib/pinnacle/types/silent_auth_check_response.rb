# frozen_string_literal: true

module Pinnacle
  module Types
    class SilentAuthCheckResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :status, -> { Pinnacle::Types::SilentAuthCheckResponseStatus }, optional: false, nullable: false
    end
  end
end
