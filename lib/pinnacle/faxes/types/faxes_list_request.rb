# frozen_string_literal: true

module Pinnacle
  module Faxes
    module Types
      class FaxesListRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :direction, -> { Pinnacle::Types::FaxDirectionEnum }, optional: true, nullable: false
      end
    end
  end
end
