# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Pinnacle
  class Tools
    class ToolsShortenUrlResponse
      # @return [String] The shortened URL.
      attr_reader :shortened_url
      # @return [DateTime] The expiration date of the shortened URL, if provided.
      attr_reader :expires_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param shortened_url [String] The shortened URL.
      # @param expires_at [DateTime] The expiration date of the shortened URL, if provided.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Tools::ToolsShortenUrlResponse]
      def initialize(shortened_url: OMIT, expires_at: OMIT, additional_properties: nil)
        @shortened_url = shortened_url if shortened_url != OMIT
        @expires_at = expires_at if expires_at != OMIT
        @additional_properties = additional_properties
        @_field_set = { "shortenedUrl": shortened_url, "expiresAt": expires_at }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ToolsShortenUrlResponse
      #
      # @param json_object [String]
      # @return [Pinnacle::Tools::ToolsShortenUrlResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        shortened_url = parsed_json["shortenedUrl"]
        expires_at = (DateTime.parse(parsed_json["expiresAt"]) unless parsed_json["expiresAt"].nil?)
        new(
          shortened_url: shortened_url,
          expires_at: expires_at,
          additional_properties: struct
        )
      end

      # Serialize an instance of ToolsShortenUrlResponse to a JSON object
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
        obj.shortened_url&.is_a?(String) != false || raise("Passed value for field obj.shortened_url is not the expected type, validation failed.")
        obj.expires_at&.is_a?(DateTime) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      end
    end
  end
end
