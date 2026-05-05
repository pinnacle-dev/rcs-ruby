# frozen_string_literal: true

module Pinnacle
  module Types
    class BlastSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :audience_id, -> { String }, optional: false, nullable: false, api_name: "audienceId"

      field :type, -> { Pinnacle::Types::BlastSummaryType }, optional: false, nullable: false

      field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :content, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :options, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :fallback, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
