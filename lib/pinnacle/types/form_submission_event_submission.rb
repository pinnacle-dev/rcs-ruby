# frozen_string_literal: true

module Pinnacle
  module Types
    # The submitted answers plus a resolved snapshot of each form field.
    class FormSubmissionEventSubmission < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: true
      field :data, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :fields, -> { Internal::Types::Array[Pinnacle::Types::FormSubmittedField] }, optional: false, nullable: false
      field :ip_address, -> { String }, optional: false, nullable: true
      field :user_agent, -> { String }, optional: false, nullable: true
      field :submitted_at, -> { String }, optional: false, nullable: false
    end
  end
end
