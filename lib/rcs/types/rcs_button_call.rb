# frozen_string_literal: true

module Rcs
  module Types
    # Button that initiates a phone call when tapped by the recipient.
    class RcsButtonCall < Internal::Types::Model
      field :metadata, -> { String }, optional: true, nullable: false
      field :payload, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
