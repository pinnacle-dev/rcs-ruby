# frozen_string_literal: true

module Pinnacle
  module Types
    class VcardPhone < Internal::Types::Model
      field :type, -> { Internal::Types::Array[Pinnacle::Types::VCardPhoneSchemaTypeItem] }, optional: true, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
