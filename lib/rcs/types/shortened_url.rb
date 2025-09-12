# frozen_string_literal: true

require_relative "pinnacle_url_config"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class ShortenedUrl
      # @return [String] Your custom shortened link following the format `https://pncl.to/{linkId}`,
      #  where `{linkId}` is the unique identifier for the URL that can be used with our
      #  other endpoint.
      attr_reader :url
      # @return [Pinnacle::Types::PinnacleUrlConfig]
      attr_reader :config
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param url [String] Your custom shortened link following the format `https://pncl.to/{linkId}`,
      #  where `{linkId}` is the unique identifier for the URL that can be used with our
      #  other endpoint.
      # @param config [Pinnacle::Types::PinnacleUrlConfig]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ShortenedUrl]
      def initialize(url:, config:, additional_properties: nil)
        @url = url
        @config = config
        @additional_properties = additional_properties
        @_field_set = { "url": url, "config": config }
      end

      # Deserialize a JSON object to an instance of ShortenedUrl
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ShortenedUrl]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        url = parsed_json["url"]
        if parsed_json["config"].nil?
          config = nil
        else
          config = parsed_json["config"].to_json
          config = Pinnacle::Types::PinnacleUrlConfig.from_json(json_object: config)
        end
        new(
          url: url,
          config: config,
          additional_properties: struct
        )
      end

      # Serialize an instance of ShortenedUrl to a JSON object
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
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        Pinnacle::Types::PinnacleUrlConfig.validate_raw(obj: obj.config)
      end
    end
  end
end
