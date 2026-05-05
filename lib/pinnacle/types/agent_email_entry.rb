# frozen_string_literal: true

module Pinnacle
  module Types
    # An email contact entry for the RCS agent's contact information.
    class AgentEmailEntry < Internal::Types::Model
      field :address, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false
    end
  end
end
