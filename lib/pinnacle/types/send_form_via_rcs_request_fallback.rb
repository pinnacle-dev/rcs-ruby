# frozen_string_literal: true

module Pinnacle
  module Types
    # When RCS is unavailable on the recipient's device, fall back to SMS from this number. Requires `to`.
    class SendFormViaRcsRequestFallback < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
    end
  end
end
