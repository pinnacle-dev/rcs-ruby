# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blast
      module Types
        class BlastSms < Internal::Types::Model
          field :audience_id, -> { String }, optional: false, nullable: false, api_name: "audienceId"
          field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :message, -> { Pinnacle::Types::SmsContent }, optional: false, nullable: false
          field :options, -> { Pinnacle::Messages::Blast::Types::BlastSmsOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
