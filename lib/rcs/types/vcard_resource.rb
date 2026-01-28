# frozen_string_literal: true

module Rcs
  module Types
    class VcardResource < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :download_url, -> { String }, optional: true, nullable: false, api_name: "downloadUrl"
    end
  end
end
