# frozen_string_literal: true

module Pinnacle
  module Types
    module MessageSummaryType
      extend Pinnacle::Internal::Types::Enum

      SMS = "SMS"
      MMS = "MMS"
      RCS = "RCS"
    end
  end
end
