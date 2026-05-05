# frozen_string_literal: true

module Pinnacle
  module Types
    # Simulates when a user presses an `openUrl` button.
    class UserButtonPressOpenUrl < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false

      field :metadata, -> { String }, optional: true, nullable: false

      field :payload, -> { String }, optional: true, nullable: false
    end
  end
end
