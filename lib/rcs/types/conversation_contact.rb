# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Contact information for the recipient in a conversation.
    class ConversationContact
      # @return [Integer] Unique identifier for the contact.
      attr_reader :id
      # @return [String] The contact's phone number in E.164 format.
      attr_reader :phone_number
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [Integer] Unique identifier for the contact.
      # @param phone_number [String] The contact's phone number in E.164 format.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ConversationContact]
      def initialize(id:, phone_number:, additional_properties: nil)
        @id = id
        @phone_number = phone_number
        @additional_properties = additional_properties
        @_field_set = { "id": id, "phoneNumber": phone_number }
      end

      # Deserialize a JSON object to an instance of ConversationContact
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ConversationContact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        phone_number = parsed_json["phoneNumber"]
        new(
          id: id,
          phone_number: phone_number,
          additional_properties: struct
        )
      end

      # Serialize an instance of ConversationContact to a JSON object
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
        obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      end
    end
  end
end
