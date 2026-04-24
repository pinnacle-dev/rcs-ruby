# frozen_string_literal: true

module Pinnacle
  module Types
    # Phone input. Client formats the value as the user types ("(555) 555-1212") and normalizes to E.164
    # ("+15555551212") before submission.
    class PhoneField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
