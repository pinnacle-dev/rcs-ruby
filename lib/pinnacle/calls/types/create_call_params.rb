# frozen_string_literal: true

module Pinnacle
  module Calls
    module Types
      class CreateCallParams < Internal::Types::Model
        field :to, -> { String }, optional: false, nullable: false

        field :from, -> { String }, optional: false, nullable: false

        field :record, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
