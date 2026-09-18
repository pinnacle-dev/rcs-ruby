# frozen_string_literal: true

module Pinnacle
  module Types
    module FaxEventType
      extend Pinnacle::Internal::Types::Enum

      FAX_STATUS = "FAX.STATUS"
      FAX_RECEIVED = "FAX.RECEIVED"
    end
  end
end
