# frozen_string_literal: true

module Pinnacle
  module Types
    # A single field definition inside a form. Discriminated by `type`.
    class FormField < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      discriminant :type

      member -> { Pinnacle::Types::TextField }, key: "TEXT"
      member -> { Pinnacle::Types::TextareaField }, key: "TEXTAREA"
      member -> { Pinnacle::Types::AddressField }, key: "ADDRESS"
      member -> { Pinnacle::Types::EmailField }, key: "EMAIL"
      member -> { Pinnacle::Types::UrlField }, key: "URL"
      member -> { Pinnacle::Types::PhoneField }, key: "PHONE"
      member -> { Pinnacle::Types::NumberField }, key: "NUMBER"
      member -> { Pinnacle::Types::RangeField }, key: "RANGE"
      member -> { Pinnacle::Types::RatingField }, key: "RATING"
      member -> { Pinnacle::Types::DateField }, key: "DATE"
      member -> { Pinnacle::Types::TimeField }, key: "TIME"
      member -> { Pinnacle::Types::DatetimeField }, key: "DATETIME"
      member -> { Pinnacle::Types::ColorField }, key: "COLOR"
      member -> { Pinnacle::Types::SelectField }, key: "SELECT"
      member -> { Pinnacle::Types::RadioField }, key: "RADIO"
      member -> { Pinnacle::Types::CheckboxField }, key: "CHECKBOX"
    end
  end
end
