# frozen_string_literal: true

module Pinnacle
  module Types
    # Complete country identification and metadata.
    class AdvancedPhoneInformationLocationCountry < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :code, -> { String }, optional: false, nullable: false
      field :code_3, -> { String }, optional: false, nullable: false, api_name: "code3"
    end
  end
end
