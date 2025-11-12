# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Messages
    module Rcs
      module Types
        # Configure how your typing indicator is sent.
        class SendTypingIndicatorSchemaOptions
          # @return [Boolean] Send via the test agent to whitelisted test devices. Useful for development and
          #  debugging.
          attr_reader :test_mode
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param test_mode [Boolean] Send via the test agent to whitelisted test devices. Useful for development and
          #  debugging.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Messages::Rcs::Types::SendTypingIndicatorSchemaOptions]
          def initialize(test_mode: OMIT, additional_properties: nil)
            @test_mode = test_mode if test_mode != OMIT
            @additional_properties = additional_properties
            @_field_set = { "test_mode": test_mode }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of SendTypingIndicatorSchemaOptions
          #
          # @param json_object [String]
          # @return [Pinnacle::Messages::Rcs::Types::SendTypingIndicatorSchemaOptions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            test_mode = parsed_json["test_mode"]
            new(test_mode: test_mode, additional_properties: struct)
          end

          # Serialize an instance of SendTypingIndicatorSchemaOptions to a JSON object
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
            obj.test_mode&.is_a?(Boolean) != false || raise("Passed value for field obj.test_mode is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
