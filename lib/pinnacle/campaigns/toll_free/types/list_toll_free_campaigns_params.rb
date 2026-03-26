# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        class ListTollFreeCampaignsParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
          field :status, -> { Pinnacle::Campaigns::TollFree::Types::ListTollFreeCampaignsRequestStatus }, optional: true, nullable: false
          field :brand_id, -> { String }, optional: true, nullable: false, api_name: "brandId"
          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
