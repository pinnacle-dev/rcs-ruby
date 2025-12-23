# frozen_string_literal: true

require "json"
require_relative "../../../types/blast_details"
require_relative "../../../types/scheduled_blast_details"

module Pinnacle
  module Messages
    module Blast
      module Types
        class BlastRcsResponse
          # Deserialize a JSON object to an instance of BlastRcsResponse
          #
          # @param json_object [String]
          # @return [Pinnacle::Messages::Blast::Types::BlastRcsResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            begin
              Pinnacle::Types::BlastDetails.validate_raw(obj: struct)
              return Pinnacle::Types::BlastDetails.from_json(json_object: struct) unless struct.nil?

              return nil
            rescue StandardError
              # noop
            end
            begin
              Pinnacle::Types::ScheduledBlastDetails.validate_raw(obj: struct)
              return Pinnacle::Types::ScheduledBlastDetails.from_json(json_object: struct) unless struct.nil?

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
              return Pinnacle::Types::BlastDetails.validate_raw(obj: obj)
            rescue StandardError
              # noop
            end
            begin
              return Pinnacle::Types::ScheduledBlastDetails.validate_raw(obj: obj)
            rescue StandardError
              # noop
            end
            raise("Passed value matched no type within the union, validation failed.")
          end
        end
      end
    end
  end
end
