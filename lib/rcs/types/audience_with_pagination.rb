# frozen_string_literal: true

require_relative "contact"
require_relative "pagination"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class AudienceWithPagination
      # @return [String] Audience public ID. This identifier is a string that always begins with the
      #  prefix `aud_`, for example: `aud_abc123`.
      attr_reader :id
      # @return [String] Audience name.
      attr_reader :name
      # @return [String] Audience description.
      attr_reader :description
      # @return [Array<Pinnacle::Types::Contact>] Array of contact objects (paginated).
      attr_reader :contacts
      # @return [Integer] Total number of contacts in audience.
      attr_reader :contact_count
      # @return [Pinnacle::Types::Pagination]
      attr_reader :pagination
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] Audience public ID. This identifier is a string that always begins with the
      #  prefix `aud_`, for example: `aud_abc123`.
      # @param name [String] Audience name.
      # @param description [String] Audience description.
      # @param contacts [Array<Pinnacle::Types::Contact>] Array of contact objects (paginated).
      # @param contact_count [Integer] Total number of contacts in audience.
      # @param pagination [Pinnacle::Types::Pagination]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AudienceWithPagination]
      def initialize(id:, name:, description:, contacts:, contact_count:, pagination:, additional_properties: nil)
        @id = id
        @name = name
        @description = description
        @contacts = contacts
        @contact_count = contact_count
        @pagination = pagination
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "name": name,
          "description": description,
          "contacts": contacts,
          "contactCount": contact_count,
          "pagination": pagination
        }
      end

      # Deserialize a JSON object to an instance of AudienceWithPagination
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AudienceWithPagination]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        name = parsed_json["name"]
        description = parsed_json["description"]
        contacts = parsed_json["contacts"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::Contact.from_json(json_object: item)
        end
        contact_count = parsed_json["contactCount"]
        if parsed_json["pagination"].nil?
          pagination = nil
        else
          pagination = parsed_json["pagination"].to_json
          pagination = Pinnacle::Types::Pagination.from_json(json_object: pagination)
        end
        new(
          id: id,
          name: name,
          description: description,
          contacts: contacts,
          contact_count: contact_count,
          pagination: pagination,
          additional_properties: struct
        )
      end

      # Serialize an instance of AudienceWithPagination to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.contacts.is_a?(Array) != false || raise("Passed value for field obj.contacts is not the expected type, validation failed.")
        obj.contact_count.is_a?(Integer) != false || raise("Passed value for field obj.contact_count is not the expected type, validation failed.")
        Pinnacle::Types::Pagination.validate_raw(obj: obj.pagination)
      end
    end
  end
end
