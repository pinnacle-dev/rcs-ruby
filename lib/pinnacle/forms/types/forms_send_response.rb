# frozen_string_literal: true

module Pinnacle
  module Forms
    module Types
      class FormsSendResponse < Internal::Types::Model
        extend Pinnacle::Internal::Types::Union

        member -> { Pinnacle::Types::SendFormResult }

        member -> { Pinnacle::Types::ScheduledFormSendResult }
      end
    end
  end
end
