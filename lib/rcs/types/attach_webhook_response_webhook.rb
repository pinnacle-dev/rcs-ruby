# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Detailed information about the attached webhook.
    class AttachWebhookResponseWebhook
      # @return [Integer] Unique identifier of the webhook within the account.
      attr_reader :id
      # @return [String] Name of the webhook.
      attr_reader :name
      # @return [String] The HTTPS endpoint URL where webhook events will be sent as HTTP POST requests.
      attr_reader :url
      # @return [String] Secret key used to verify the authenticity of incoming webhook requests. <br>
      #  This secret key will be stored in the `PINNACLE-SIGNING-SECRET` header.
      attr_reader :secret
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [Integer] Unique identifier of the webhook within the account.
      # @param name [String] Name of the webhook.
      # @param url [String] The HTTPS endpoint URL where webhook events will be sent as HTTP POST requests.
      # @param secret [String] Secret key used to verify the authenticity of incoming webhook requests. <br>
      #  This secret key will be stored in the `PINNACLE-SIGNING-SECRET` header.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AttachWebhookResponseWebhook]
      def initialize(id:, name:, url:, secret: OMIT, additional_properties: nil)
        @id = id
        @name = name
        @url = url
        @secret = secret if secret != OMIT
        @additional_properties = additional_properties
        @_field_set = { "id": id, "name": name, "url": url, "secret": secret }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AttachWebhookResponseWebhook
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AttachWebhookResponseWebhook]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        name = parsed_json["name"]
        url = parsed_json["url"]
        secret = parsed_json["secret"]
        new(
          id: id,
          name: name,
          url: url,
          secret: secret,
          additional_properties: struct
        )
      end

      # Serialize an instance of AttachWebhookResponseWebhook to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.secret&.is_a?(String) != false || raise("Passed value for field obj.secret is not the expected type, validation failed.")
      end
    end
  end
end
