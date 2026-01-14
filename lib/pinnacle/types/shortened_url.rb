# frozen_string_literal: true

module Pinnacle
  module Types
    class ShortenedUrl < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
      field :config, -> { Pinnacle::Types::PinnacleUrlConfig }, optional: false, nullable: false
    end
  end
end
