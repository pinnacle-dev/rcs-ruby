# frozen_string_literal: true

module Pinnacle
  module Types
    # Webhook body delivered to subscribers of `CAMPAIGN.STATUS` whenever
    # an RCS campaign's per-carrier launch status or verification status
    # (AEGIS / Google) changes. `CAMPAIGN.STATUS` is only supported for
    # RCS agent senders — the attach call rejects phone-number senders
    # with `400 Bad Request`. Verify the `PINNACLE-SIGNING-SECRET` header
    # matches the signing secret of the webhook this event was delivered
    # to before trusting the payload.
    class CampaignStatusEvent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :agent, -> { Pinnacle::Types::CampaignStatusEventAgent }, optional: false, nullable: false
      field :campaign, -> { Pinnacle::Types::CampaignStatusEventCampaign }, optional: false, nullable: false
      field :brand, -> { Pinnacle::Types::CampaignStatusEventBrand }, optional: false, nullable: false
      field :carrier_launches, -> { Pinnacle::Types::CampaignStatusEventCarrierLaunches }, optional: false, nullable: false, api_name: "carrierLaunches"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
