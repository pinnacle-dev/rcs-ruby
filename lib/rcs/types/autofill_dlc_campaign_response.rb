# frozen_string_literal: true

module Rcs
  module Types
    class AutofillDlcCampaignResponse < Internal::Types::Model
      field :auto_renew, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "autoRenew"
      field :brand, -> { String }, optional: true, nullable: false
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :description, -> { String }, optional: true, nullable: false
      field :keywords, -> { Rcs::Types::AutofillDlcResponseKeywords }, optional: true, nullable: false
      field :links, -> { Rcs::Types::AutofillDlcResponseLinks }, optional: true, nullable: false
      field :message_flow, -> { String }, optional: true, nullable: false, api_name: "messageFlow"
      field :name, -> { String }, optional: true, nullable: false
      field :options, -> { Rcs::Types::AutofillDlcResponseOptions }, optional: true, nullable: false
      field :sample_messages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "sampleMessages"
      field :use_case, -> { Rcs::Types::AutofillDlcResponseUseCase }, optional: true, nullable: false, api_name: "useCase"
    end
  end
end
