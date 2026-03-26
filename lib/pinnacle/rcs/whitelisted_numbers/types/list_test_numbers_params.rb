# frozen_string_literal: true

module Pinnacle
  module Rcs
    module WhitelistedNumbers
      module Types
        class ListTestNumbersParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
          field :agent_id, -> { String }, optional: true, nullable: false, api_name: "agentId"
          field :number, -> { String }, optional: true, nullable: false
          field :status, -> { Pinnacle::Rcs::WhitelistedNumbers::Types::ListTestNumbersRequestStatus }, optional: true, nullable: false
        end
      end
    end
  end
end
