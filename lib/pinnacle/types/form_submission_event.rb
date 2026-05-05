# frozen_string_literal: true

module Pinnacle
  module Types
    # Webhook body delivered to subscribers of `FORM.SUBMISSION` after a recipient completes a form. Verify the
    # `PINNACLE-SIGNING-SECRET` header matches your webhook's signing secret before trusting the payload.
    class FormSubmissionEvent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :sender, -> { String }, optional: false, nullable: false

      field :conversation, -> { Pinnacle::Types::FormSubmissionEventConversation }, optional: false, nullable: true

      field :form, -> { Pinnacle::Types::FormSubmissionEventForm }, optional: false, nullable: false

      field :submission, -> { Pinnacle::Types::FormSubmissionEventSubmission }, optional: false, nullable: false
    end
  end
end
