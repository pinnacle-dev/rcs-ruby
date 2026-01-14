# frozen_string_literal: true

module Pinnacle
  module Types
    class VettingFeedback < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false
      field :display_name, -> { String }, optional: false, nullable: false, api_name: "displayName"
      field :fields, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
