# frozen_string_literal: true

module Pinnacle
  module Messages
    module Sms
      module Types
        class Sms < Internal::Types::Model
          field :from, -> { String }, optional: false, nullable: false
          field :options, -> { Pinnacle::Messages::Sms::Types::SendSmsOptions }, optional: true, nullable: false
          field :text, -> { String }, optional: false, nullable: false
          field :to, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
