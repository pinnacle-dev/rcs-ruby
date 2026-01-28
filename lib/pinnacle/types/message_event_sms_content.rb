# frozen_string_literal: true

module Pinnacle
  module Types
    # SMS message containing plain text only.
    class MessageEventSmsContent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
