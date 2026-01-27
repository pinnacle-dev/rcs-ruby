# frozen_string_literal: true

module Rcs
  module Types
    class ShortenedUrl < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
      field :config, -> { Rcs::Types::PinnacleUrlConfig }, optional: false, nullable: false
    end
  end
end
