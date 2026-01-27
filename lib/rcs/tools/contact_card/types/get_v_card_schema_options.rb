# frozen_string_literal: true

module Rcs
  module Tools
    module ContactCard
      module Types
        class GetVCardSchemaOptions < Internal::Types::Model
          field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
        end
      end
    end
  end
end
