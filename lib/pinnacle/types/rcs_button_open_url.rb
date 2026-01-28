# frozen_string_literal: true

module Pinnacle
  module Types
    # Button that opens a URL when tapped by the recipient.
    class RcsButtonOpenUrl < Internal::Types::Model
      field :webview_mode, -> { Pinnacle::Types::RcsButtonOpenUrlWebviewMode }, optional: true, nullable: false, api_name: "webviewMode"
      field :payload, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
      field :metadata, -> { String }, optional: true, nullable: false
    end
  end
end
