# frozen_string_literal: true

module Pinnacle
  module Types
    # Simulates when a user presses a `sendLocation` button.
    class UserButtonPressSendLocation < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false
      field :metadata, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :lat_long, -> { Pinnacle::Types::UserButtonPressSendLocationLatLong }, optional: true, nullable: false, api_name: "latLong"
    end
  end
end
