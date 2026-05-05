# frozen_string_literal: true

module Pinnacle
  module Types
    # Image background. The image is tiled or scaled across the page with optional blur and dark tint overlay.
    class FormBackgroundImage < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false

      field :tint_opacity, -> { Integer }, optional: false, nullable: false

      field :blur, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :zoom, -> { Integer }, optional: false, nullable: false
    end
  end
end
