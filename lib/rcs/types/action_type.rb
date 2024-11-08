# frozen_string_literal: true

module Pinnacle
  # Type of action for the button. 'openUrl' opens a URL, 'call' dials a phone
  #  number, 'trigger' sends the predefined payload to the webhook when pressed,
  #  'requestUserLocation' requests the user's location, 'scheduleEvent' creates a
  #  calendar event, 'sendLocation' sends a location.
  class ActionType
    OPEN_URL = "openUrl"
    CALL = "call"
    TRIGGER = "trigger"
    REQUEST_USER_LOCATION = "requestUserLocation"
    SCHEDULE_EVENT = "scheduleEvent"
    SEND_LOCATION = "sendLocation"
  end
end
