# frozen_string_literal: true

module Pinnacle
  module Types
    class MessageSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::MessageSummaryStatus }, optional: false, nullable: false

      field :direction, -> { Pinnacle::Types::MessageSummaryDirection }, optional: false, nullable: false

      field :type, -> { Pinnacle::Types::MessageSummaryType }, optional: false, nullable: false

      field :method_, -> { Pinnacle::Types::MessageSummaryMethod }, optional: false, nullable: false, api_name: "method"

      field :num_segments, -> { Integer }, optional: false, nullable: false, api_name: "numSegments"

      field :cost, -> { Integer }, optional: false, nullable: true

      field :from, -> { String }, optional: false, nullable: true

      field :to, -> { String }, optional: false, nullable: true

      field :content, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :error, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :is_test, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isTest"

      field :blast_id, -> { String }, optional: false, nullable: true, api_name: "blastId"

      field :sent_at, -> { String }, optional: false, nullable: true, api_name: "sentAt"

      field :delivered_at, -> { String }, optional: false, nullable: true, api_name: "deliveredAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
