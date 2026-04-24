# frozen_string_literal: true

module Pinnacle
  module Types
    # URL input. Server requires a valid absolute URL.
    class UrlField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
