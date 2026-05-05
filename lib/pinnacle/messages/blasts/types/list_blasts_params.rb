# frozen_string_literal: true

module Pinnacle
  module Messages
    module Blasts
      module Types
        class ListBlastsParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"

          field :audience_id, -> { String }, optional: true, nullable: false, api_name: "audienceId"

          field :sender, -> { String }, optional: true, nullable: false

          field :content, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
