# frozen_string_literal: true

module Pinnacle
  module Tools
    module Url
      module Types
        class UpdateUrlParams < Internal::Types::Model
          field :link_id, -> { String }, optional: false, nullable: false, api_name: "linkId"
          field :url, -> { String }, optional: true, nullable: false
          field :options, -> { Pinnacle::Types::CreateUrlOptions }, optional: true, nullable: false
        end
      end
    end
  end
end
