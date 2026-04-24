# frozen_string_literal: true

module Pinnacle
  module Types
    # Conversation between the sender and the recipient the form was delivered to. Only populated when the form was
    # dispatched via `POST /forms/send` with a `to` recipient — that's the only call that opens a conversation tied to a
    # form submission.
    #
    # Null in every other case, including:
    # - `POST /forms/send` without a `to` (URL-only mints — no message is sent, so no conversation exists).
    # - Submissions to a form whose URL was shared by any other means (e.g. an RCS card built with `POST /send`, a chat
    # message, a marketing email, or a link on your site). The recipient isn't tied to a Pinnacle conversation in those
    # flows.
    class FormSubmissionEventConversation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
    end
  end
end
