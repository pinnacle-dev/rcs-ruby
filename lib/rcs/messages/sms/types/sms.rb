# frozen_string_literal: true

module Rcs
  module Messages
    module Sms
      module Types
        class Sms < Internal::Types::Model
          field :from, -> { String }, optional: false, nullable: false
          field :options, -> { Rcs::Messages::Sms::Types::SendSmsOptions }, optional: true, nullable: false
          field :text, -> { String }, optional: false, nullable: false
          field :to, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
