# frozen_string_literal: true

module Rcs
  module Types
    # Keyword response configuration.
    class DlcWithExtendedBrandAndStatusKeywords < Internal::Types::Model
      field :help, -> { Rcs::Types::DlcWithExtendedBrandAndStatusKeywordsHelp }, optional: false, nullable: false, api_name: "HELP"
      field :opt_in, -> { Rcs::Types::DlcWithExtendedBrandAndStatusKeywordsOptIn }, optional: false, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Rcs::Types::DlcWithExtendedBrandAndStatusKeywordsOptOut }, optional: false, nullable: false, api_name: "OPT_OUT"
    end
  end
end
