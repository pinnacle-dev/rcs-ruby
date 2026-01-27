# frozen_string_literal: true

module Rcs
  module Types
    class OptionalBrandInfo < Internal::Types::Model
      field :address, -> { String }, optional: true, nullable: false
      field :contact, -> { Rcs::Types::OptionalContacts }, optional: true, nullable: false
      field :dba, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :ein, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :sector, -> { Rcs::Types::CompanySectorEnum }, optional: true, nullable: false
      field :type, -> { Rcs::Types::CompanyTypeEnum }, optional: true, nullable: false
      field :entity_type, -> { Rcs::Types::CompanyEntityTypeEnum }, optional: true, nullable: false, api_name: "entityType"
      field :website, -> { String }, optional: true, nullable: false
    end
  end
end
