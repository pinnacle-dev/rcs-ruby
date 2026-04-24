# frozen_string_literal: true

module Pinnacle
  module Types
    # A single submission against a form.
    class FormSubmission < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :form_id, -> { String }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: true
      field :to, -> { String }, optional: false, nullable: true
      field :data, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true
      field :ip_address, -> { String }, optional: false, nullable: true
      field :user_agent, -> { String }, optional: false, nullable: true
      field :submitted_at, -> { String }, optional: false, nullable: true
      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
