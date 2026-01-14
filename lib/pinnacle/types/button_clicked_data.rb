# frozen_string_literal: true

module Pinnacle
  module Types
    # Unified data structure for button click events.
    class ButtonClickedData < Internal::Types::Model
      field :button, -> { Pinnacle::Types::ButtonClickedDataButton }, optional: false, nullable: false
      field :message_id, -> { String }, optional: false, nullable: true, api_name: "messageId"
    end
  end
end
