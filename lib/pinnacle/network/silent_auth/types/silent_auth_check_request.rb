# frozen_string_literal: true

module Pinnacle
  module Network
    module SilentAuth
      module Types
        class SilentAuthCheckRequest < Internal::Types::Model
          field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

          field :code, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
