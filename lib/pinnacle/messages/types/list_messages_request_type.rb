# frozen_string_literal: true

module Pinnacle
  module Messages
    module Types
      module ListMessagesRequestType
        extend Pinnacle::Internal::Types::Enum

        SMS = "SMS"
        MMS = "MMS"
        RCS = "RCS"
      end
    end
  end
end
