# frozen_string_literal: true

module Pinnacle
  module Types
    class ShortenedUrlWithClickData < Internal::Types::Model
      field :clicks, -> { Internal::Types::Array[Pinnacle::Types::LinkClickEvent] }, optional: false, nullable: false
    end
  end
end
