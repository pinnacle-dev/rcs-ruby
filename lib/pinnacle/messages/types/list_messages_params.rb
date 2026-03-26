# frozen_string_literal: true

module Pinnacle
  module Messages
    module Types
      class ListMessagesParams < Internal::Types::Model
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
        field :direction, -> { Pinnacle::Messages::Types::ListMessagesRequestDirection }, optional: true, nullable: false
        field :status, -> { Pinnacle::Messages::Types::ListMessagesRequestStatus }, optional: true, nullable: false
        field :type, -> { Pinnacle::Messages::Types::ListMessagesRequestType }, optional: true, nullable: false
        field :method_, -> { Pinnacle::Messages::Types::ListMessagesRequestMethod }, optional: true, nullable: false, api_name: "method"
        field :from, -> { String }, optional: true, nullable: false
        field :to, -> { String }, optional: true, nullable: false
        field :content, -> { String }, optional: true, nullable: false
        field :date_from, -> { String }, optional: true, nullable: false, api_name: "dateFrom"
        field :date_to, -> { String }, optional: true, nullable: false, api_name: "dateTo"
      end
    end
  end
end
