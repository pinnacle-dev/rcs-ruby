# frozen_string_literal: true

module Pinnacle
  module Types
    class RichMediaMessage < Internal::Types::Model
      field :media, -> { String }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Pinnacle::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
    end
  end
end
