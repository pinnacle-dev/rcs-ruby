# frozen_string_literal: true

module Pinnacle
  module Network
    module SubscriberMatch
      module Types
        class SubscriberMatchRequest < Internal::Types::Model
          field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"

          field :attributes, -> { Pinnacle::Types::SubscriberMatchAttributes }, optional: false, nullable: false
        end
      end
    end
  end
end
