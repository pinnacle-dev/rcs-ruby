# frozen_string_literal: true

module Rcs
  module Types
    # Keyword response configuration.
    class AutofillDlcResponseKeywords < Internal::Types::Model
      field :help, -> { Rcs::Types::AutofillDlcResponseKeywordsHelp }, optional: false, nullable: false, api_name: "HELP"
      field :opt_in, -> { Rcs::Types::AutofillDlcResponseKeywordsOptIn }, optional: false, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Rcs::Types::AutofillDlcResponseKeywordsOptOut }, optional: false, nullable: false, api_name: "OPT_OUT"
    end
  end
end
