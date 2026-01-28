# frozen_string_literal: true

module Rcs
  module Conversations
    module Types
      class ConversationsListMessagesRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
        field :sort_order, -> { Rcs::Conversations::Types::ConversationsListMessagesRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
        field :direction, -> { Rcs::Conversations::Types::ConversationsListMessagesRequestDirection }, optional: true, nullable: false
        field :status, -> { Rcs::Conversations::Types::ConversationsListMessagesRequestStatus }, optional: true, nullable: false
        field :type, -> { Rcs::Conversations::Types::ConversationsListMessagesRequestType }, optional: true, nullable: false
        field :date_from, -> { String }, optional: true, nullable: false, api_name: "dateFrom"
        field :date_to, -> { String }, optional: true, nullable: false, api_name: "dateTo"
      end
    end
  end
end
