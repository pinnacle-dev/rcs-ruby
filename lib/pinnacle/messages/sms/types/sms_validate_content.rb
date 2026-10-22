# frozen_string_literal: true

module Pinnacle
  module Messages
    module Sms
      module Types
        class SmsValidateContent < Internal::Types::Model
          field :text, -> { String }, optional: false, nullable: false

          field :sender, -> { String }, optional: true, nullable: false

          field :direction, -> { Pinnacle::Messages::Sms::Types::SmsValidateContentDirection }, optional: true, nullable: false
        end
      end
    end
  end
end
