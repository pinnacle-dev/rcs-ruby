# frozen_string_literal: true

module Pinnacle
  module Network
    module Requests
      module Types
        class ListNetworkRequestsParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"

          field :type, -> { Pinnacle::Types::NetworkRequestType }, optional: true, nullable: false

          field :status, -> { Pinnacle::Types::NetworkRequestStatus }, optional: true, nullable: false

          field :client_ref, -> { String }, optional: true, nullable: false, api_name: "clientRef"
        end
      end
    end
  end
end
