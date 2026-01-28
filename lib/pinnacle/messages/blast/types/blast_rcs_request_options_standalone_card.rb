# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blast
      module Types
        # Configure standalone card layout options for enhanced visual presentation.
        #
        # > **⚠️ Important Restriction**
        # >
        # > This option is **only valid for single card messages**. Using it with multiple cards will cause the request
        # to fail with a validation error.
        class BlastRcsRequestOptionsStandaloneCard < Internal::Types::Model
          field :orientation, -> { Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardOrientation }, optional: true, nullable: false
          field :image_alignment, -> { Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardImageAlignment }, optional: true, nullable: false
        end
      end
    end
  end
end
