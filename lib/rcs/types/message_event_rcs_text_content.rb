# frozen_string_literal: true

module Rcs
  module Types
    # RCS message containing longer text content with optional quick reply buttons.
    class MessageEventRcsTextContent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
