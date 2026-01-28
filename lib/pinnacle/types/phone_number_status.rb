# frozen_string_literal: true

module Pinnacle
  module Types
    # Response for get phone number status.
    class PhoneNumberStatus < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
      field :status, -> { Pinnacle::Types::PhoneNumberStatusEnum }, optional: false, nullable: false
    end
  end
end
