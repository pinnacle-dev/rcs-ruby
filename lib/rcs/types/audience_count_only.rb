# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class AudienceCountOnly
      # @return [String] Audience public ID. This identifier is a string that always begins with the
      #  prefix `aud_`, for example: `aud_abc123`.
      attr_reader :id
      # @return [String] Audience name.
      attr_reader :name
      # @return [String] Audience description.
      attr_reader :description
      # @return [Integer] Total number of contacts in audience.
      #  Use the [Get Audience](/api-reference/audiences/get) endpoint with the
      #  pagination parameters to get the audience with its contacts.
      attr_reader :contact_count
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
      # @param contact_count [Integer] Total number of contacts in audience.
      #  Use the [Get Audience](/api-reference/audiences/get) endpoint with the
      #  pagination parameters to get the audience with its contacts.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AudienceCountOnly]
      def initialize(id:, name:, description:, contact_count:, additional_properties: nil)
        @id = id
        @name = name
        @description = description
        @contact_count = contact_count
        @additional_properties = additional_properties
        @_field_set = { "id": id, "name": name, "description": description, "contactCount": contact_count }
      end

      # Deserialize a JSON object to an instance of AudienceCountOnly
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AudienceCountOnly]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        name = parsed_json["name"]
        description = parsed_json["description"]
        contact_count = parsed_json["contactCount"]
        new(
          id: id,
          name: name,
          description: description,
          contact_count: contact_count,
          additional_properties: struct
        )
      end

      # Serialize an instance of AudienceCountOnly to a JSON object
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
        obj.contact_count.is_a?(Integer) != false || raise("Passed value for field obj.contact_count is not the expected type, validation failed.")
      end
    end
  end
end
