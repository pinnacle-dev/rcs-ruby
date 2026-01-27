# frozen_string_literal: true

module Rcs
  module Audiences
    module Types
      class AudiencesGetRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :page, -> { Integer }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
