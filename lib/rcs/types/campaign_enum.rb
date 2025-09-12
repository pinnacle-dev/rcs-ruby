# frozen_string_literal: true

module Pinnacle
  module Types
    # The type of campaign:
    #  - TOLL_FREE: Toll-free number campaigns
    #  - 10DLC: 10-digit long code campaigns for A2P messaging
    #  - RCS: Rich Communication Services campaigns
    class CampaignEnum
      TOLL_FREE = "TOLL_FREE"
      TEN_DLC = "10DLC"
      RCS = "RCS"
    end
  end
end
