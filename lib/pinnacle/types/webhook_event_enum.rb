# frozen_string_literal: true

module Pinnacle
  module Types
    module WebhookEventEnum
      extend Pinnacle::Internal::Types::Enum

      MESSAGE_STATUS = "MESSAGE.STATUS"
      MESSAGE_RECEIVED = "MESSAGE.RECEIVED"
      USER_TYPING = "USER.TYPING"
    end
  end
end
