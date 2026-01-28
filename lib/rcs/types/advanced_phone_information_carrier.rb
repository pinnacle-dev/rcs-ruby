# frozen_string_literal: true

module Rcs
  module Types
    # Detailed carrier information.
    class AdvancedPhoneInformationCarrier < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :normalized_carrier, -> { String }, optional: false, nullable: false, api_name: "normalizedCarrier"
      field :mcc, -> { String }, optional: false, nullable: false
      field :mnc, -> { String }, optional: false, nullable: false
    end
  end
end
