# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Contact information for the brand.
    class NullableContact
      # @return [String] Email address of the contact person.
      attr_reader :email
      # @return [String] Full name of the contact person.
      attr_reader :name
      # @return [String] Phone number of the contact person in E.164 format.
      attr_reader :phone
      # @return [String] Job title of the contact person.
      attr_reader :title
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param email [String] Email address of the contact person.
      # @param name [String] Full name of the contact person.
      # @param phone [String] Phone number of the contact person in E.164 format.
      # @param title [String] Job title of the contact person.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::NullableContact]
      def initialize(email: OMIT, name: OMIT, phone: OMIT, title: OMIT, additional_properties: nil)
        @email = email if email != OMIT
        @name = name if name != OMIT
        @phone = phone if phone != OMIT
        @title = title if title != OMIT
        @additional_properties = additional_properties
        @_field_set = { "email": email, "name": name, "phone": phone, "title": title }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of NullableContact
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::NullableContact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        email = parsed_json["email"]
        name = parsed_json["name"]
        phone = parsed_json["phone"]
        title = parsed_json["title"]
        new(
          email: email,
          name: name,
          phone: phone,
          title: title,
          additional_properties: struct
        )
      end

      # Serialize an instance of NullableContact to a JSON object
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
        obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      end
    end
  end
end
