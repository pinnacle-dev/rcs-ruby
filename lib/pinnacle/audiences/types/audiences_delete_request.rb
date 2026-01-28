# frozen_string_literal: true

module Pinnacle
  module Audiences
    module Types
      class AudiencesDeleteRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
