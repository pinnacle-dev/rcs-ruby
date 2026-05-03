# frozen_string_literal: true

module Pinnacle
  module Types
    # External verifier status. AEGIS (the U.S. carrier vetting
    # authority used by AT&T, T-Mobile, and Verizon) and Google each
    # send a verification email to the brand's contact address. Each
    # verifier moves through `NOT_SENT` → `SENT` → `VERIFIED` once
    # the brand replies and the verifier confirms ownership.
    class CarrierLaunchesVerification < Internal::Types::Model
      field :aegis, -> { Pinnacle::Types::VerificationStatus }, optional: false, nullable: false, api_name: "AEGIS"
      field :google, -> { Pinnacle::Types::VerificationStatus }, optional: false, nullable: false, api_name: "GOOGLE"
    end
  end
end
