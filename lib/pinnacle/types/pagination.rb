# frozen_string_literal: true

module Pinnacle
  module Types
    class Pagination < Internal::Types::Model
      field :page, -> { Integer }, optional: false, nullable: false
      field :limit, -> { Integer }, optional: false, nullable: false
      field :total, -> { Integer }, optional: false, nullable: false
      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"
    end
  end
end
