# frozen_string_literal: true

module Rcs
  module Types
    # Unified data structure for button click events.
    class ButtonClickedData < Internal::Types::Model
      field :button, -> { Rcs::Types::ButtonClickedDataButton }, optional: false, nullable: false
      field :message_id, -> { String }, optional: false, nullable: true, api_name: "messageId"
    end
  end
end
