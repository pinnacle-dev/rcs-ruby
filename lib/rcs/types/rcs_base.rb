# frozen_string_literal: true

require_relative "rcs_base_options"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class RcsBase
      # @return [String] Your RCS agent ID which must be prefixed with 'agent_'.
      attr_reader :from
      # @return [Pinnacle::Types::RcsBaseOptions] Configure how your RCS message is sent and tracked.
      attr_reader :options
      # @return [String] Recipient's phone number in E.164 format.
      attr_reader :to
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param from [String] Your RCS agent ID which must be prefixed with 'agent_'.
      # @param options [Pinnacle::Types::RcsBaseOptions] Configure how your RCS message is sent and tracked.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsBase]
      def initialize(from:, to:, options: OMIT, additional_properties: nil)
        @from = from
        @options = options if options != OMIT
        @to = to
        @additional_properties = additional_properties
        @_field_set = { "from": from, "options": options, "to": to }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsBase
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsBase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        from = parsed_json["from"]
        if parsed_json["options"].nil?
          options = nil
        else
          options = parsed_json["options"].to_json
          options = Pinnacle::Types::RcsBaseOptions.from_json(json_object: options)
        end
        to = parsed_json["to"]
        new(
          from: from,
          options: options,
          to: to,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsBase to a JSON object
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
        obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
        obj.options.nil? || Pinnacle::Types::RcsBaseOptions.validate_raw(obj: obj.options)
        obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      end
    end
  end
end
