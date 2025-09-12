# frozen_string_literal: true

require_relative "../../../types/opt_in_method_enum"
require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    class TollFree
      # Opt-in keyword settings.
      class UpsertTollFreeSchemaOptIn
        # @return [Pinnacle::OptInMethodEnum]
        attr_reader :method
        # @return [String] Url to opt in.
        attr_reader :url
        # @return [String] Explain how users find the opt-in.
        attr_reader :workflow_description
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param method [Pinnacle::OptInMethodEnum]
        # @param url [String] Url to opt in.
        # @param workflow_description [String] Explain how users find the opt-in.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Pinnacle::Campaigns::TollFree::UpsertTollFreeSchemaOptIn]
        def initialize(method: OMIT, url: OMIT, workflow_description: OMIT, additional_properties: nil)
          @method = method if method != OMIT
          @url = url if url != OMIT
          @workflow_description = workflow_description if workflow_description != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "method": method,
            "url": url,
            "workflowDescription": workflow_description
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of UpsertTollFreeSchemaOptIn
        #
        # @param json_object [String]
        # @return [Pinnacle::Campaigns::TollFree::UpsertTollFreeSchemaOptIn]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          method = parsed_json["method"]
          url = parsed_json["url"]
          workflow_description = parsed_json["workflowDescription"]
          new(
            method: method,
            url: url,
            workflow_description: workflow_description,
            additional_properties: struct
          )
        end

        # Serialize an instance of UpsertTollFreeSchemaOptIn to a JSON object
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
          obj.method&.is_a?(Pinnacle::OptInMethodEnum) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
          obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
          obj.workflow_description&.is_a?(String) != false || raise("Passed value for field obj.workflow_description is not the expected type, validation failed.")
        end
      end
    end
  end
end
