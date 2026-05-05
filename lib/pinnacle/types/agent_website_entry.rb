# frozen_string_literal: true

module Pinnacle
  module Types
    # A website contact entry for the RCS agent's contact information.
    class AgentWebsiteEntry < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false
    end
  end
end
