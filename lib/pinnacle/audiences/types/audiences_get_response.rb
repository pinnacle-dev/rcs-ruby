# frozen_string_literal: true

module Pinnacle
  module Audiences
    module Types
      class AudiencesGetResponse < Internal::Types::Model
        extend Pinnacle::Internal::Types::Union

        member -> { Pinnacle::Types::AudienceWithPagination }
        member -> { Pinnacle::Types::AudienceCountOnly }
      end
    end
  end
end
