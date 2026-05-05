# frozen_string_literal: true

module Pinnacle
  module Types
    class ScheduledFormSendResponseSubmission < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
