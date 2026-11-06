# frozen_string_literal: true

module Pinnacle
  module Types
    class MessagingSubscriptionList < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Pinnacle::Types::MessagingSubscription] }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :page_index, -> { Integer }, optional: false, nullable: false, api_name: "pageIndex"

      field :page_size, -> { Integer }, optional: false, nullable: false, api_name: "pageSize"
    end
  end
end
