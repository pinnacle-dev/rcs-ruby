# frozen_string_literal: true

module Pinnacle
  module Types
    # Location data shared by the user.
    class MessageEventRcsLocationDataData < Internal::Types::Model
      field :address, -> { String }, optional: false, nullable: false
      field :latitude, -> { Integer }, optional: false, nullable: false
      field :longitude, -> { Integer }, optional: false, nullable: false
      field :text, -> { String }, optional: true, nullable: false
    end
  end
end
