# frozen_string_literal: true

module Pinnacle
  module Calls
    module Types
      class CallsDownloadRecordingRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :expires_in, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
