# frozen_string_literal: true

module Pinnacle
  module Network
    module SimSwap
      module Types
        class SimSwapRequest < Internal::Types::Model
          field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"

          field :period_hours, -> { Integer }, optional: true, nullable: false, api_name: "periodHours"
        end
      end
    end
  end
end
