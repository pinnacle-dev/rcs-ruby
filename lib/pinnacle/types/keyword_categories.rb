# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordCategories < Internal::Types::Model
      field :opt_in, -> { Pinnacle::Types::KeywordCategory }, optional: false, nullable: false, api_name: "OPT_IN"

      field :opt_out, -> { Pinnacle::Types::KeywordCategory }, optional: false, nullable: false, api_name: "OPT_OUT"

      field :help, -> { Pinnacle::Types::KeywordCategory }, optional: false, nullable: false, api_name: "HELP"
    end
  end
end
