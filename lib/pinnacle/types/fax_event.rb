# frozen_string_literal: true

module Pinnacle
  module Types
    # Fax webhook notification. `FAX.STATUS` reports lifecycle changes, and `FAX.RECEIVED` means an inbound fax is
    # ready.
    #
    # Webhooks intentionally omit `mediaUrl`. When `fax.hasMedia` is true, call the authenticated `GET /fax/{fax.id}`
    # endpoint to receive a signed document URL that expires after one hour. Treat the URL as sensitive: do not log or
    # store it, and request a new one after it expires.
    class FaxEvent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { Pinnacle::Types::FaxEventType }, optional: false, nullable: false

      field :fax, -> { Pinnacle::Types::Fax }, optional: false, nullable: false
    end
  end
end
