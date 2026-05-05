# frozen_string_literal: true

module Pinnacle
  module Types
    # Send a form from an RCS agent. `from` must be an `agent_*` id.
    class SendFormViaRcsParams < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: true, nullable: false

      field :form, -> { Pinnacle::Types::SendFormViaRcsRequestForm }, optional: false, nullable: false

      field :fallback, -> { Pinnacle::Types::SendFormViaRcsRequestFallback }, optional: true, nullable: false

      field :options, -> { Pinnacle::Types::SendFormOptions }, optional: true, nullable: false
    end
  end
end
