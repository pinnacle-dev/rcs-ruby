# frozen_string_literal: true

module Pinnacle
  module Messages
    module Rcs
      module Types
        # Configure how your typing indicator is sent.
        class SendTypingIndicatorSchemaOptions < Internal::Types::Model
          field :test_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
