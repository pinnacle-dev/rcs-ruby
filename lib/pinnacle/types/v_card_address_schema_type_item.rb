# frozen_string_literal: true

module Pinnacle
  module Types
    module VCardAddressSchemaTypeItem
      extend Pinnacle::Internal::Types::Enum

      DOM = "DOM"
      INTL = "INTL"
      POSTAL = "POSTAL"
      PARCEL = "PARCEL"
      HOME = "HOME"
      WORK = "WORK"
      PREF = "PREF"
    end
  end
end
