# frozen_string_literal: true

module Rcs
  module Types
    # SMS message containing plain text only.
    class SmsContent < Internal::Types::Model
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
