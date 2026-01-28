# frozen_string_literal: true

module Pinnacle
  module Types
    class VcardResource < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :download_url, -> { String }, optional: true, nullable: false, api_name: "downloadUrl"
    end
  end
end
