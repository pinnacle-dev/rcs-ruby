# frozen_string_literal: true

module Pinnacle
  module Types
    # Voice call lifecycle update delivered to webhooks attached to a phone number.
    class CallStatusEvent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :sender, -> { String }, optional: false, nullable: false

      field :call, -> { Pinnacle::Types::CallStatusEventCall }, optional: false, nullable: false
    end
  end
end
