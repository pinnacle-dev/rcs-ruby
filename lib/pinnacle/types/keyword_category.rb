# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordCategory < Internal::Types::Model
      field :keywords, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"

      field :response, -> { String }, optional: false, nullable: false
    end
  end
end
