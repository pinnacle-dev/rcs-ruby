# frozen_string_literal: true

module Rcs
  module Types
    # Individual card containing title, optional media, and action buttons.
    class RichCard < Internal::Types::Model
      field :buttons, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false
      field :media, -> { String }, optional: true, nullable: false
      field :subtitle, -> { String }, optional: true, nullable: false
      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
