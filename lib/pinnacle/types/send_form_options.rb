# frozen_string_literal: true

module Pinnacle
  module Types
    # Optional delivery knobs shared by RCS and SMS sends.
    class SendFormOptions < Internal::Types::Model
      field :schedule, -> { Pinnacle::Types::MessageSchedule }, optional: true, nullable: false
      field :webview_mode, -> { Pinnacle::Types::SendFormOptionsWebviewMode }, optional: true, nullable: false
    end
  end
end
