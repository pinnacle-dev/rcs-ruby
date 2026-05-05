# frozen_string_literal: true

module Pinnacle
  module Webhooks
    module Types
      class ListWebhooksParams < Internal::Types::Model
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"

        field :status, -> { Pinnacle::Webhooks::Types::ListWebhooksRequestStatus }, optional: true, nullable: false

        field :endpoint, -> { String }, optional: true, nullable: false
      end
    end
  end
end
