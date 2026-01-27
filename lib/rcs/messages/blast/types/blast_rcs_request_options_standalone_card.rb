# frozen_string_literal: true

module Rcs
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
          field :orientation, -> { Rcs::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardOrientation }, optional: true, nullable: false
          field :image_alignment, -> { Rcs::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCardImageAlignment }, optional: true, nullable: false
        end
      end
    end
  end
end
