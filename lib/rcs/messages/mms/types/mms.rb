# frozen_string_literal: true

module Rcs
  module Messages
    module Mms
      module Types
        class Mms < Internal::Types::Model
          field :from, -> { String }, optional: false, nullable: false
          field :media_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "mediaUrls"
          field :options, -> { Rcs::Messages::Mms::Types::SendMmsOptions }, optional: true, nullable: false
          field :text, -> { String }, optional: false, nullable: false
          field :to, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
