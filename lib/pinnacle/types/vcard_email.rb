# frozen_string_literal: true

module Pinnacle
  module Types
    class VcardEmail < Internal::Types::Model
      field :type, -> { Internal::Types::Array[Pinnacle::Types::VCardEmailSchemaTypeItem] }, optional: true, nullable: false
      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
