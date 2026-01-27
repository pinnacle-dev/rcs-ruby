# frozen_string_literal: true

module Rcs
  module Types
    class ShortenedUrlWithClickData < Internal::Types::Model
      field :clicks, -> { Internal::Types::Array[Rcs::Types::LinkClickEvent] }, optional: false, nullable: false
    end
  end
end
