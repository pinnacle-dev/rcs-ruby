# frozen_string_literal: true

module Pinnacle
  module Forms
    module Types
      class ListFormsParams < Internal::Types::Model
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
      end
    end
  end
end
