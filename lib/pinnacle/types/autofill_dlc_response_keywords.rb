# frozen_string_literal: true

module Pinnacle
  module Types
    # Keyword response configuration.
    class AutofillDlcResponseKeywords < Internal::Types::Model
      field :help, -> { Pinnacle::Types::AutofillDlcResponseKeywordsHelp }, optional: false, nullable: false, api_name: "HELP"
      field :opt_in, -> { Pinnacle::Types::AutofillDlcResponseKeywordsOptIn }, optional: false, nullable: false, api_name: "OPT_IN"
      field :opt_out, -> { Pinnacle::Types::AutofillDlcResponseKeywordsOptOut }, optional: false, nullable: false, api_name: "OPT_OUT"
    end
  end
end
