# frozen_string_literal: true

module Pinnacle
  module Types
    # Information about a phone number sender in a conversation.
    class Phone < Internal::Types::Model
      field :capabilities, -> { Pinnacle::Types::PhoneCapabilities }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :is_sandbox, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isSandbox"
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
