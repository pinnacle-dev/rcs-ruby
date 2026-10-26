# frozen_string_literal: true

module Pinnacle
  module Network
    module SilentAuth
      module Types
        class SilentAuthRequest < Internal::Types::Model
          field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"

          field :client_ref, -> { String }, optional: true, nullable: false, api_name: "clientRef"

          field :format, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
