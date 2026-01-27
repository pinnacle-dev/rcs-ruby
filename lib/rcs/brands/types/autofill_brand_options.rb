# frozen_string_literal: true

module Rcs
  module Brands
    module Types
      class AutofillBrandOptions < Internal::Types::Model
        field :force_reload, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "forceReload"
      end
    end
  end
end
