# frozen_string_literal: true

module Rcs
  module Messages
    module Blast
      module Types
        class BlastMms < Internal::Types::Model
          field :audience_id, -> { String }, optional: false, nullable: false, api_name: "audienceId"
          field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :message, -> { Rcs::Types::MmsContent }, optional: false, nullable: false
          field :options, -> { Rcs::Messages::Blast::Types::BlastMmsOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
