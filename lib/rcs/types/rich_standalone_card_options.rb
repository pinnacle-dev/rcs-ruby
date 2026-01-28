# frozen_string_literal: true

module Rcs
  module Types
    # Configure standalone card layout options for enhanced visual presentation.
    #
    # > **⚠️ Important Restriction**
    # >
    # > This option is **only valid for single card messages** with static media. Using it with multiple cards will
    # cause the request to fail with a validation error.
    # > GIFs and videos are not supported and will be rendered as vertical cards.
    class RichStandaloneCardOptions < Internal::Types::Model
      field :orientation, -> { Rcs::Types::SendRcsCardOptionsStandaloneCardOrientation }, optional: true, nullable: false
      field :image_alignment, -> { Rcs::Types::SendRcsCardOptionsStandaloneCardImageAlignment }, optional: true, nullable: false
    end
  end
end
