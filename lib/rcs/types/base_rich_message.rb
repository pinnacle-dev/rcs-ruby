# frozen_string_literal: true

module Rcs
  module Types
    class BaseRichMessage < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :options, -> { Rcs::Types::SendRichMessageOptions }, optional: true, nullable: false
      field :to, -> { String }, optional: false, nullable: false
    end
  end
end
