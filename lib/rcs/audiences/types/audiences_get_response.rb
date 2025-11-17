# frozen_string_literal: true

require "json"
require_relative "../../types/audience_with_pagination"
require_relative "../../types/audience_count_only"

module Pinnacle
  module Audiences
    module Types
      class AudiencesGetResponse
        # Deserialize a JSON object to an instance of AudiencesGetResponse
        #
        # @param json_object [String]
        # @return [Pinnacle::Audiences::Types::AudiencesGetResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          begin
            Pinnacle::Types::AudienceWithPagination.validate_raw(obj: struct)
            return Pinnacle::Types::AudienceWithPagination.from_json(json_object: struct) unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          begin
            Pinnacle::Types::AudienceCountOnly.validate_raw(obj: struct)
            return Pinnacle::Types::AudienceCountOnly.from_json(json_object: struct) unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          struct
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given
        #  hash and check each fields type against the current object's property
        #  definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          begin
            return Pinnacle::Types::AudienceWithPagination.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          begin
            return Pinnacle::Types::AudienceCountOnly.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          raise("Passed value matched no type within the union, validation failed.")
        end
      end
    end
  end
end
