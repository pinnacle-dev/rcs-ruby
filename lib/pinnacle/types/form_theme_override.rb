# frozen_string_literal: true

module Pinnacle
  module Types
    # Sparse override layered on top of your team's theme. Every field is optional; provided fields replace the
    # corresponding team defaults at render time. URL fields must use `https://`.
    class FormThemeOverride < Internal::Types::Model
      field :logo_url, -> { String }, optional: true, nullable: false
      field :favicon_url, -> { String }, optional: true, nullable: false
      field :theme_mode, -> { Pinnacle::Types::FormThemeOverrideThemeMode }, optional: true, nullable: false
      field :colors, -> { Pinnacle::Types::FormThemeOverrideColors }, optional: true, nullable: false
      field :font_family, -> { Pinnacle::Types::FormThemeOverrideFontFamily }, optional: true, nullable: false
      field :corner_radius, -> { Pinnacle::Types::FormThemeOverrideCornerRadius }, optional: true, nullable: false
      field :content_alignment, -> { Pinnacle::Types::FormThemeOverrideContentAlignment }, optional: true, nullable: false
      field :background, -> { Pinnacle::Types::FormBackground }, optional: true, nullable: false
      field :submit_button_label, -> { String }, optional: true, nullable: false
      field :success_message, -> { String }, optional: true, nullable: false
      field :redirect_url, -> { String }, optional: true, nullable: false
      field :privacy_url, -> { String }, optional: true, nullable: false
      field :terms_url, -> { String }, optional: true, nullable: false
      field :og_image_url, -> { String }, optional: true, nullable: false
      field :og_description, -> { String }, optional: true, nullable: false
    end
  end
end
