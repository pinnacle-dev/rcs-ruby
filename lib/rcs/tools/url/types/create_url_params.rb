# frozen_string_literal: true

module Rcs
  module Tools
    module Url
      module Types
        class CreateUrlParams < Internal::Types::Model
          field :url, -> { String }, optional: false, nullable: false
          field :options, -> { Rcs::Types::CreateUrlOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
