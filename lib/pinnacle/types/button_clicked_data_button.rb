# frozen_string_literal: true

module Pinnacle
  module Types
    # Information about the button that was clicked.
    class ButtonClickedDataButton < Internal::Types::Model
      field :type, -> { Pinnacle::Types::ButtonClickedDataButtonType }, optional: true, nullable: false
      field :raw, -> { Pinnacle::Types::ButtonClickedDataButtonRaw }, optional: false, nullable: false
      field :payload, -> { String }, optional: true, nullable: false
      field :metadata, -> { String }, optional: true, nullable: false
      field :clicks, -> { Integer }, optional: false, nullable: false
    end
  end
end
