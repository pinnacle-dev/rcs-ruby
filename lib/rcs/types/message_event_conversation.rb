# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Conversation metadata containing the conversation ID, sender, and recipient
    #  information.
    class MessageEventConversation
      # @return [Integer] Unique identifier for the conversation. To get more conversation details, use
      #  the [POST /conversations/get](/api-reference/conversations/get) endpoint.
      attr_reader :id
      # @return [String] Sender's phone number or agent ID.
      attr_reader :from
      # @return [String] Recipient's phone number.
      attr_reader :to
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [Integer] Unique identifier for the conversation. To get more conversation details, use
      #  the [POST /conversations/get](/api-reference/conversations/get) endpoint.
      # @param from [String] Sender's phone number or agent ID.
      # @param to [String] Recipient's phone number.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventConversation]
      def initialize(id:, from:, to:, additional_properties: nil)
        @id = id
        @from = from
        @to = to
        @additional_properties = additional_properties
        @_field_set = { "id": id, "from": from, "to": to }
      end

      # Deserialize a JSON object to an instance of MessageEventConversation
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventConversation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        from = parsed_json["from"]
        to = parsed_json["to"]
        new(
          id: id,
          from: from,
          to: to,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventConversation to a JSON object
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
        obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
        obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      end
    end
  end
end
