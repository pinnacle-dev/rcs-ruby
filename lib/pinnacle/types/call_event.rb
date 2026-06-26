# frozen_string_literal: true

module Pinnacle
  module Types
    class CallEvent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :call_session_id, -> { String }, optional: false, nullable: false

      field :event_type, -> { String }, optional: false, nullable: false

      field :source, -> { Pinnacle::Types::CallEventSource }, optional: false, nullable: false

      field :direction, -> { Pinnacle::Types::CallDirection }, optional: false, nullable: true

      field :command_id, -> { String }, optional: false, nullable: true

      field :latency_ms, -> { Integer }, optional: false, nullable: true

      field :occurred_at, -> { String }, optional: false, nullable: false

      field :received_at, -> { String }, optional: false, nullable: false

      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
