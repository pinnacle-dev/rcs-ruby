# frozen_string_literal: true

module Rcs
  module Messages
    module Rcs
      module Types
        class SendTypingIndicatorSchema < Internal::Types::Model
          field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
          field :to, -> { String }, optional: false, nullable: false
          field :options, -> { Rcs::Messages::Rcs::Types::SendTypingIndicatorSchemaOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
