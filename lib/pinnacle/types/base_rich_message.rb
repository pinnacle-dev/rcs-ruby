# frozen_string_literal: true

module Pinnacle
  module Types
    class BaseRichMessage < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :options, -> { Pinnacle::Types::SendRichMessageOptions }, optional: true, nullable: false
      field :to, -> { String }, optional: false, nullable: false
    end
  end
end
