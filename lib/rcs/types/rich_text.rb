# frozen_string_literal: true

module Rcs
  module Types
    # Message containing longer text content with optional quick reply buttons.
    class RichText < Internal::Types::Model
      field :quick_replies, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
