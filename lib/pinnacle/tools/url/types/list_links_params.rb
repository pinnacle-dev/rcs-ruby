# frozen_string_literal: true

module Pinnacle
  module Tools
    module Url
      module Types
        class ListLinksParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
          field :endpoint, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
