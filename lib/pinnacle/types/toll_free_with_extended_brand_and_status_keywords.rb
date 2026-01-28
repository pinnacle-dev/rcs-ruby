# frozen_string_literal: true

module Pinnacle
  module Types
    # Keyword response configuration.
    class TollFreeWithExtendedBrandAndStatusKeywords < Internal::Types::Model
      field :help, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
    end
  end
end
