# frozen_string_literal: true

module Pinnacle
  module Types
    # Result from the original check, or null while the request is still pending or no result is available.
    class NetworkRequestResult < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::SimSwapResponse }

      member -> { Pinnacle::Types::SubscriberMatchResponse }

      member -> { Pinnacle::Types::SilentAuthCheckResponse }
    end
  end
end
