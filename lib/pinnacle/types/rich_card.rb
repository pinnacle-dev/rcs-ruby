# frozen_string_literal: true

module Pinnacle
  module Types
    # Individual card containing title, optional media, and action buttons.
    class RichCard < Internal::Types::Model
      field :buttons, -> { Internal::Types::Array[Pinnacle::Types::RichButton] }, optional: true, nullable: false

      field :media, -> { String }, optional: true, nullable: false

      field :media_height, -> { Pinnacle::Types::RcsCardsCardsItemMediaHeight }, optional: true, nullable: false, api_name: "mediaHeight"

      field :subtitle, -> { String }, optional: true, nullable: false

      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
