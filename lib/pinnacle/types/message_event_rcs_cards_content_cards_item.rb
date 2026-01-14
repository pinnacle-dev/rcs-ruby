# frozen_string_literal: true

module Pinnacle
  module Types
    # Individual card containing title, optional media, and action buttons.
    class MessageEventRcsCardsContentCardsItem < Internal::Types::Model
      field :buttons, -> { Internal::Types::Array[Pinnacle::Types::RichButton] }, optional: false, nullable: false
      field :media, -> { Pinnacle::Types::RcsMediaDetailsContent }, optional: true, nullable: false
      field :subtitle, -> { String }, optional: true, nullable: false
      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
