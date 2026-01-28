# frozen_string_literal: true

module Rcs
  module Types
    # File associated to the contact.
    class VCardDataFile < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
      field :metadata, -> { Rcs::Types::VCardDataFileMetadata }, optional: false, nullable: false
    end
  end
end
