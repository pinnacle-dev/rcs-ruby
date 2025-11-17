# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class Pagination
      # @return [Integer] Current page number (1-indexed).
      attr_reader :page
      # @return [Integer] Items per page (max 100, default 50).
      attr_reader :limit
      # @return [Integer] Total number of contacts in the audience.
      attr_reader :total
      # @return [Boolean] Whether more pages exist.
      attr_reader :has_more
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param page [Integer] Current page number (1-indexed).
      # @param limit [Integer] Items per page (max 100, default 50).
      # @param total [Integer] Total number of contacts in the audience.
      # @param has_more [Boolean] Whether more pages exist.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::Pagination]
      def initialize(page:, limit:, total:, has_more:, additional_properties: nil)
        @page = page
        @limit = limit
        @total = total
        @has_more = has_more
        @additional_properties = additional_properties
        @_field_set = { "page": page, "limit": limit, "total": total, "hasMore": has_more }
      end

      # Deserialize a JSON object to an instance of Pagination
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::Pagination]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        page = parsed_json["page"]
        limit = parsed_json["limit"]
        total = parsed_json["total"]
        has_more = parsed_json["hasMore"]
        new(
          page: page,
          limit: limit,
          total: total,
          has_more: has_more,
          additional_properties: struct
        )
      end

      # Serialize an instance of Pagination to a JSON object
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
        obj.page.is_a?(Integer) != false || raise("Passed value for field obj.page is not the expected type, validation failed.")
        obj.limit.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
        obj.total.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
        obj.has_more.is_a?(Boolean) != false || raise("Passed value for field obj.has_more is not the expected type, validation failed.")
      end
    end
  end
end
