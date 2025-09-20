# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Response containing the generated RCS service id and/or url. You can always
    #  create a link with the service id that is returned.
    #  To create a link follow the format:
    #  sms://{PHONE_NUMBER}?service_id={SERVICE_ID}&body={URL_ENCODED_BODY}
    class RcsLinkResult
      # @return [String] The generated RCS link URL. If no phone number is provided, no url will be
      #  generated.
      attr_reader :url
      # @return [String] The service ID used for the link
      attr_reader :service_id
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param url [String] The generated RCS link URL. If no phone number is provided, no url will be
      #  generated.
      # @param service_id [String] The service ID used for the link
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsLinkResult]
      def initialize(service_id:, url: OMIT, additional_properties: nil)
        @url = url if url != OMIT
        @service_id = service_id
        @additional_properties = additional_properties
        @_field_set = { "url": url, "serviceId": service_id }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsLinkResult
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsLinkResult]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        url = parsed_json["url"]
        service_id = parsed_json["serviceId"]
        new(
          url: url,
          service_id: service_id,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsLinkResult to a JSON object
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
        obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.service_id.is_a?(String) != false || raise("Passed value for field obj.service_id is not the expected type, validation failed.")
      end
    end
  end
end
