# frozen_string_literal: true

module Rcs
  module Types
    class VcardPhone < Internal::Types::Model
      field :type, -> { Internal::Types::Array[Rcs::Types::VCardPhoneSchemaTypeItem] }, optional: true, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
