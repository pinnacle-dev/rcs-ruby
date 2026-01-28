# frozen_string_literal: true

module Rcs
  module Audiences
    module Types
      class AudiencesGetResponse < Internal::Types::Model
        extend Rcs::Internal::Types::Union

        member -> { Rcs::Types::AudienceWithPagination }
        member -> { Rcs::Types::AudienceCountOnly }
      end
    end
  end
end
