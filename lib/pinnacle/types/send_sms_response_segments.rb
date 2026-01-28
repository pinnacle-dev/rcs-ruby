# frozen_string_literal: true

module Pinnacle
  module Types
    # Details about how the message was segmented for sending.
    class SendSmsResponseSegments < Internal::Types::Model
      field :count, -> { Integer }, optional: false, nullable: false
      field :encoding, -> { Pinnacle::Types::SendSmsResponseSegmentsEncoding }, optional: false, nullable: false
    end
  end
end
