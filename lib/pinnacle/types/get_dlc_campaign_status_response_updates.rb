# frozen_string_literal: true

module Pinnacle
  module Types
    # Status of local long code numbers that are being attached to this campaign. <br>
    #
    # Note that phone numbers can only be attached to `VERIFIED` campaigns via the [attach campaign
    # endpoint](../phone-numbers/attach-campaign).
    class GetDlcCampaignStatusResponseUpdates < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :status, -> { Pinnacle::Types::DlcAssignmentStatusEnum }, optional: false, nullable: false
      field :errors, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
