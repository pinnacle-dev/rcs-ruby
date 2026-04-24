# frozen_string_literal: true

module Pinnacle
  module Types
    # Form summary carried on the FORM.SUBMISSION event.
    class FormSubmissionEventForm < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
