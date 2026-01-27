# frozen_string_literal: true

module Rcs
  module Audiences
    module Types
      class UpdateAudienceParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
