# frozen_string_literal: true

module Pinnacle
  module Messages
    module Types
      class ReactMessageParams < Internal::Types::Model
        field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"
        field :options, -> { Pinnacle::Messages::Types::ReactMessageOptions }, optional: true, nullable: false
        field :reaction, -> { String }, optional: false, nullable: true
      end
    end
  end
end
