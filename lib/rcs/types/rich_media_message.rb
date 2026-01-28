# frozen_string_literal: true

module Rcs
  module Types
    class RichMediaMessage < Internal::Types::Model
      field :media, -> { String }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
    end
  end
end
