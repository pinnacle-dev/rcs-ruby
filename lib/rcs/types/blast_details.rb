# frozen_string_literal: true

module Rcs
  module Types
    # Response containing details about the scheduled blast.
    class BlastDetails < Internal::Types::Model
      field :blast_id, -> { String }, optional: false, nullable: false, api_name: "blastId"
      field :audience_id, -> { String }, optional: false, nullable: false, api_name: "audienceId"
      field :total_recipients, -> { Integer }, optional: false, nullable: false, api_name: "totalRecipients"
      field :total_messages, -> { Integer }, optional: false, nullable: false, api_name: "totalMessages"
      field :total_segments, -> { Integer }, optional: false, nullable: false, api_name: "totalSegments"
      field :total_cost, -> { Integer }, optional: false, nullable: false, api_name: "totalCost"
    end
  end
end
