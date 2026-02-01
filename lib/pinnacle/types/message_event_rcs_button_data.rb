# frozen_string_literal: true

module Pinnacle
  module Types
    # Button click event data received when a user clicks on an RCS button or quick reply (excluding
    # `requestUserLocation` buttons).
    #
    # This event contains information about which button was clicked, how many times it's been clicked, and any payload
    # or metadata attached to the button. Use this data to handle user interactions with your RCS messages.
    class MessageEventRcsButtonData < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :button, -> { Pinnacle::Types::MessageEventRcsButtonDataButton }, optional: false, nullable: false
      field :message_id, -> { String }, optional: false, nullable: true, api_name: "messageId"
    end
  end
end
