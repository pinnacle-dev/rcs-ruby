# frozen_string_literal: true

module Pinnacle
  module Types
    # Existing form id or an inline definition that mints a new form for this send.
    class SendFormViaRcsRequestForm < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { String }
      member -> { Pinnacle::Types::FormDefinition }
    end
  end
end
