# frozen_string_literal: true

module Pinnacle
  module Types
    class Fax < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :direction, -> { Pinnacle::Types::FaxDirectionEnum }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::FaxStatusEnum }, optional: false, nullable: false

      field :pages, -> { Integer }, optional: false, nullable: false

      field :duration_seconds, -> { Integer }, optional: false, nullable: false, api_name: "durationSeconds"

      field :partial_content, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "partialContent"

      field :failure_reason, -> { Pinnacle::Types::FaxFailureReasonEnum }, optional: false, nullable: true, api_name: "failureReason"

      field :cost, -> { Integer }, optional: false, nullable: false

      field :reserved_cost, -> { Integer }, optional: false, nullable: false, api_name: "reservedCost"

      field :billing_status, -> { Pinnacle::Types::FaxBillingStatusEnum }, optional: false, nullable: false, api_name: "billingStatus"

      field :has_media, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMedia"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
