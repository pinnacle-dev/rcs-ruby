# frozen_string_literal: true

module Pinnacle
  module Messages
    module Sms
      module Types
        module SmsValidateContentDirection
          extend Pinnacle::Internal::Types::Enum

          INBOUND = "INBOUND"
          OUTBOUND = "OUTBOUND"
        end
      end
    end
  end
end
