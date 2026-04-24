# frozen_string_literal: true

module Pinnacle
  module Types
    # Send a form from a phone number. `from` must be an E.164 phone.
    class SendFormViaSmsParams < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: true, nullable: false
      field :form, -> { Pinnacle::Types::SendFormViaSmsRequestForm }, optional: false, nullable: false
      field :options, -> { Pinnacle::Types::SendFormOptions }, optional: true, nullable: false
    end
  end
end
