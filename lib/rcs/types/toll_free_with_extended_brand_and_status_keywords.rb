# frozen_string_literal: true

module Rcs
  module Types
    # Keyword response configuration.
    class TollFreeWithExtendedBrandAndStatusKeywords < Internal::Types::Model
      field :help, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusKeywordsHelp }, optional: true, nullable: false, api_name: "HELP"
      field :opt_in, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusKeywordsOptIn }, optional: true, nullable: false, api_name: "OPT_IN"
    end
  end
end
