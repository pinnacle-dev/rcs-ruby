# frozen_string_literal: true

module Pinnacle
  module Types
    class OwnedPhoneNumber < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false

      field :sms, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :mms, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :voice, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :is_sandbox, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSandbox"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
