# frozen_string_literal: true

module Pinnacle
  module Types
    module WebhookSummaryStatus
      extend Pinnacle::Internal::Types::Enum

      DISABLED = "DISABLED"
      ENABLED = "ENABLED"
      DELETED = "DELETED"
    end
  end
end
