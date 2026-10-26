# frozen_string_literal: true

module Pinnacle
  module Types
    class CreatedCall < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :state, -> { Pinnacle::Types::CallState }, optional: false, nullable: false

      field :direction, -> { Pinnacle::Types::CallDirection }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :started_at, -> { String }, optional: false, nullable: true

      field :answered_at, -> { String }, optional: false, nullable: true

      field :ended_at, -> { String }, optional: false, nullable: true

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false

      field :recording_state, -> { Pinnacle::Types::RecordingState }, optional: false, nullable: true

      field :hangup_cause, -> { String }, optional: false, nullable: true

      field :record, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
