# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class CompanyAdditionalWebsitesItem
    # @return [String] The URL of the additional website
    attr_reader :url
    # @return [String] The label for the additional website
    attr_reader :label
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param url [String] The URL of the additional website
    # @param label [String] The label for the additional website
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CompanyAdditionalWebsitesItem]
    def initialize(url: OMIT, label: OMIT, additional_properties: nil)
      @url = url if url != OMIT
      @label = label if label != OMIT
      @additional_properties = additional_properties
      @_field_set = { "url": url, "label": label }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CompanyAdditionalWebsitesItem
    #
    # @param json_object [String]
    # @return [Pinnacle::CompanyAdditionalWebsitesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      url = parsed_json["url"]
      label = parsed_json["label"]
      new(
        url: url,
        label: label,
        additional_properties: struct
      )
    end

    # Serialize an instance of CompanyAdditionalWebsitesItem to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end
