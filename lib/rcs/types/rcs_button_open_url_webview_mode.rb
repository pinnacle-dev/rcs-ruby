# frozen_string_literal: true

module Pinnacle
  module Types
    # Controls how the URL is displayed when the button is tapped.
    #  **Default behavior:** If not specified, the URL opens in the device's default
    #  browser. If you're sending deeplinks, you should use this mode as it will open
    #  the deeplink in the native app if it is installed.
    #  **Available modes in order of size:**
    #  - `HALF` — Half-screen webview overlay
    #  - `TALL` — Tall webview overlay
    #  - `FULL` — Full-screen webview
    class RcsButtonOpenUrlWebviewMode
      HALF = "HALF"
      TALL = "TALL"
      FULL = "FULL"
    end
  end
end
