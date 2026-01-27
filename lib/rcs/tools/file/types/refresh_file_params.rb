# frozen_string_literal: true

module Rcs
  module Tools
    module File
      module Types
        class RefreshFileParams < Internal::Types::Model
          field :urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
