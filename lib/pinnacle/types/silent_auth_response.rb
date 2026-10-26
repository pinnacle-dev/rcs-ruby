# frozen_string_literal: true

module Pinnacle
  module Types
    class SilentAuthResponse < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      discriminant :format

      member -> { Pinnacle::Types::HostedSilentAuthResponse }, key: "HOSTED"

      member -> { Pinnacle::Types::JsonSilentAuthResponse }, key: "JSON_"
    end
  end
end
