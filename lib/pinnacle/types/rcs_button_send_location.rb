# frozen_string_literal: true

module Pinnacle
  module Types
    # Button that shares a specific location with the recipient when tapped.
    class RcsButtonSendLocation < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :lat_long, -> { Pinnacle::Types::RcsButtonSendLocationLatLong }, optional: false, nullable: false, api_name: "latLong"
      field :title, -> { String }, optional: false, nullable: false
      field :metadata, -> { String }, optional: true, nullable: false
    end
  end
end
