# frozen_string_literal: true

module Rcs
  module Messages
    module Types
      class ReactMessageParams < Internal::Types::Model
        field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"
        field :options, -> { Rcs::Messages::Types::ReactMessageOptions }, optional: true, nullable: false
        field :reaction, -> { String }, optional: false, nullable: true
      end
    end
  end
end
