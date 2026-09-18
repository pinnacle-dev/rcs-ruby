# frozen_string_literal: true

module Pinnacle
  module Types
    class ListFaxesResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Pinnacle::Types::Fax] }, optional: false, nullable: false

      field :next_offset, -> { Integer }, optional: false, nullable: true, api_name: "nextOffset"
    end
  end
end
