# frozen_string_literal: true

module Pinnacle
  module Calls
    module Types
      class CreateStreamTokenParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :commands_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :stream_id, -> { String }, optional: true, nullable: false

        field :record, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
