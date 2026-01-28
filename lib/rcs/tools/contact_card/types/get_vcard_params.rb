# frozen_string_literal: true

module Rcs
  module Tools
    module ContactCard
      module Types
        class GetVcardParams < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :options, -> { Rcs::Tools::ContactCard::Types::GetVCardSchemaOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
