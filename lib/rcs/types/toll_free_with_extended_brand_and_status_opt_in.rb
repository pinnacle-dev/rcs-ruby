# frozen_string_literal: true

module Rcs
  module Types
    # Opt-in keyword settings.
    class TollFreeWithExtendedBrandAndStatusOptIn < Internal::Types::Model
      field :method_, -> { Rcs::Types::OptInMethodEnum }, optional: true, nullable: false, api_name: "method"
      field :url, -> { String }, optional: true, nullable: false
      field :workflow_description, -> { String }, optional: true, nullable: false, api_name: "workflowDescription"
    end
  end
end
