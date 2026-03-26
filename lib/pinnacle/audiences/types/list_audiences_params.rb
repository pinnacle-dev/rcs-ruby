# frozen_string_literal: true

module Pinnacle
  module Audiences
    module Types
      class ListAudiencesParams < Internal::Types::Model
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
        field :name, -> { String }, optional: true, nullable: false
      end
    end
  end
end
