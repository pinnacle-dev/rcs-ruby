# frozen_string_literal: true

module Pinnacle
  module Tools
    module Url
      module Types
        class CreateUrlParams < Internal::Types::Model
          field :url, -> { String }, optional: false, nullable: false
          field :options, -> { Pinnacle::Types::CreateUrlOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
