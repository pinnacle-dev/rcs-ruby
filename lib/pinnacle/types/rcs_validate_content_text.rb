# frozen_string_literal: true

module Pinnacle
  module Types
    # Message containing longer text content with optional quick reply buttons.
    class RcsValidateContentText < Internal::Types::Model
      field :quick_replies, -> { Internal::Types::Array[Pinnacle::Types::RichButton] }, optional: true, nullable: false, api_name: "quickReplies"

      field :text, -> { String }, optional: false, nullable: false

      field :sender, -> { String }, optional: true, nullable: false

      field :direction, -> { Pinnacle::Types::RcsValidateContentTextDirection }, optional: true, nullable: false
    end
  end
end
