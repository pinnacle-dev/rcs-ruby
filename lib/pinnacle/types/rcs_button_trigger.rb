# frozen_string_literal: true

module Pinnacle
  module Types
    # Button that sends custom data back to your application when tapped by the recipient.
    class RcsButtonTrigger < Internal::Types::Model
      field :metadata, -> { String }, optional: true, nullable: false
      field :payload, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
