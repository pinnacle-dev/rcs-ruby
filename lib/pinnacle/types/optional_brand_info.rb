# frozen_string_literal: true

module Pinnacle
  module Types
    class OptionalBrandInfo < Internal::Types::Model
      field :address, -> { String }, optional: true, nullable: false
      field :contact, -> { Pinnacle::Types::OptionalContacts }, optional: true, nullable: false
      field :dba, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :ein, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :sector, -> { Pinnacle::Types::CompanySectorEnum }, optional: true, nullable: false
      field :type, -> { Pinnacle::Types::CompanyTypeEnum }, optional: true, nullable: false
      field :entity_type, -> { Pinnacle::Types::CompanyEntityTypeEnum }, optional: true, nullable: false, api_name: "entityType"
      field :website, -> { String }, optional: true, nullable: false
    end
  end
end
