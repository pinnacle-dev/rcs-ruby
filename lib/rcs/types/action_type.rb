# frozen_string_literal: true

module Pinnacle
  # Type of action for the button. 'openUrl' opens a URL, 'call' dials a phone
  #  number, 'trigger' sends the predefined payload to the webhook when pressed,
  #  'requestLocation' requests the user's location, 'scheduleEvent' creates a
  #  calendar event, 'sendLocation' sends a location.
  class ActionType
    OPEN_URL = "openUrl"
    CALL = "call"
    TRIGGER = "trigger"
    REQUEST_LOCATION = "requestLocation"
    SCHEDULE_EVENT = "scheduleEvent"
    SEND_LOCATION = "sendLocation"
  end
end
