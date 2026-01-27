# frozen_string_literal: true

module Rcs
  module Types
    class Message < Internal::Types::Model
      field :content, -> { Rcs::Types::MessageContent }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: true
      field :delivered_at, -> { String }, optional: false, nullable: true, api_name: "deliveredAt"
      field :error, -> { String }, optional: false, nullable: true
      field :id, -> { String }, optional: false, nullable: false
      field :method_, -> { Rcs::Types::MessageMethodEnum }, optional: false, nullable: false, api_name: "method"
      field :num_segments, -> { Integer }, optional: false, nullable: false, api_name: "numSegments"
      field :receiver, -> { String }, optional: false, nullable: false
      field :sender, -> { String }, optional: false, nullable: false
      field :sent_at, -> { String }, optional: false, nullable: true, api_name: "sentAt"
      field :status, -> { Rcs::Types::MessageStatusEnum }, optional: false, nullable: false
      field :type, -> { Rcs::Types::MessageProtocolEnum }, optional: false, nullable: false
    end
  end
end
