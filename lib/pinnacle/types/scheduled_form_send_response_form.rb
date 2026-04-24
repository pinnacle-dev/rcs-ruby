# frozen_string_literal: true

module Pinnacle
  module Types
    class ScheduledFormSendResponseForm < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
