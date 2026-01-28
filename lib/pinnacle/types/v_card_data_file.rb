# frozen_string_literal: true

module Pinnacle
  module Types
    # File associated to the contact.
    class VCardDataFile < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
      field :metadata, -> { Pinnacle::Types::VCardDataFileMetadata }, optional: false, nullable: false
    end
  end
end
