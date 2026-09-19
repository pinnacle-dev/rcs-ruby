# frozen_string_literal: true

module Pinnacle
  module Faxes
    module Types
      class SendFaxParams < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

        field :from, -> { String }, optional: false, nullable: false

        field :to, -> { String }, optional: false, nullable: false

        field :media_url, -> { String }, optional: false, nullable: false, api_name: "mediaUrl"

        field :quality, -> { Pinnacle::Types::FaxQualityEnum }, optional: true, nullable: false
      end
    end
  end
end
