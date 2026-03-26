# frozen_string_literal: true

module Pinnacle
  module Webhooks
    module Types
      module ListWebhooksRequestStatus
        extend Pinnacle::Internal::Types::Enum

        DISABLED = "DISABLED"
        ENABLED = "ENABLED"
        DELETED = "DELETED"
      end
    end
  end
end
