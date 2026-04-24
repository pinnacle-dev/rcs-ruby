# frozen_string_literal: true

module Pinnacle
  module Forms
    module Submissions
      module Types
        class ListFormSubmissionsParams < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
        end
      end
    end
  end
end
