# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsValidationResult < Internal::Types::Model
      field :total, -> { Integer }, optional: false, nullable: false
      field :unit, -> { Integer }, optional: false, nullable: false
      field :segments, -> { Integer }, optional: false, nullable: false
      field :unsupported_files, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "unsupportedFiles"
    end
  end
end
