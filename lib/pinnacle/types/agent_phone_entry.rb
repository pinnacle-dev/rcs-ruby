# frozen_string_literal: true

module Pinnacle
  module Types
    # A phone number contact entry for the RCS agent's contact information.
    class AgentPhoneEntry < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :label, -> { String }, optional: false, nullable: false
    end
  end
end
