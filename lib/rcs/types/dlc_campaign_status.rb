# frozen_string_literal: true

module Rcs
  module Types
    # Response for get DLC campaign status.
    class DlcCampaignStatus < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :status, -> { Rcs::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :updates, -> { Rcs::Types::GetDlcCampaignStatusResponseUpdates }, optional: false, nullable: false
    end
  end
end
