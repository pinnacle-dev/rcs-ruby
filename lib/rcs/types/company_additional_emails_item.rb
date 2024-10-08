# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class CompanyAdditionalEmailsItem
    # @return [String] The additional email address
    attr_reader :email
    # @return [String] The label for the additional email address
    attr_reader :label
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] The additional email address
    # @param label [String] The label for the additional email address
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CompanyAdditionalEmailsItem]
    def initialize(email: OMIT, label: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @label = label if label != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email": email, "label": label }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CompanyAdditionalEmailsItem
    #
    # @param json_object [String]
    # @return [Pinnacle::CompanyAdditionalEmailsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      label = parsed_json["label"]
      new(
        email: email,
        label: label,
        additional_properties: struct
      )
    end

    # Serialize an instance of CompanyAdditionalEmailsItem to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end
