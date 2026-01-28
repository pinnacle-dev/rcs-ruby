# frozen_string_literal: true

module Pinnacle
  module Types
    # Legal documentation links.
    class DlcWithExtendedBrandAndStatusLinks < Internal::Types::Model
      field :privacy_policy, -> { String }, optional: true, nullable: false, api_name: "privacyPolicy"
      field :terms_of_service, -> { String }, optional: true, nullable: false, api_name: "termsOfService"
    end
  end
end
