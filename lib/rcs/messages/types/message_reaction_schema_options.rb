# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Messages
    class MessageReactionSchemaOptions
      # @return [Boolean] By default, only messages sent with the `options.tracking` field can be
      #  precisely reacted to. <br>
      #  Set `options.force` to true to bypass this restriction (may react to a different
      #  message). <br>
      #  For MMS and RCS, only messages containing text can be tracked. Otherwise,
      #  `options.force` is ignored.
      attr_reader :force
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param force [Boolean] By default, only messages sent with the `options.tracking` field can be
      #  precisely reacted to. <br>
      #  Set `options.force` to true to bypass this restriction (may react to a different
      #  message). <br>
      #  For MMS and RCS, only messages containing text can be tracked. Otherwise,
      #  `options.force` is ignored.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Messages::MessageReactionSchemaOptions]
      def initialize(force: OMIT, additional_properties: nil)
        @force = force if force != OMIT
        @additional_properties = additional_properties
        @_field_set = { "force": force }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MessageReactionSchemaOptions
      #
      # @param json_object [String]
      # @return [Pinnacle::Messages::MessageReactionSchemaOptions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        force = parsed_json["force"]
        new(force: force, additional_properties: struct)
      end

      # Serialize an instance of MessageReactionSchemaOptions to a JSON object
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
        obj.force&.is_a?(Boolean) != false || raise("Passed value for field obj.force is not the expected type, validation failed.")
      end
    end
  end
end
