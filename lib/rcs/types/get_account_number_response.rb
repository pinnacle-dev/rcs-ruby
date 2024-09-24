# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class GetAccountNumberResponse
    # @return [String] The phone number associated with the account in E.164 format
    attr_reader :account_number
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param account_number [String] The phone number associated with the account in E.164 format
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::GetAccountNumberResponse]
    def initialize(account_number: OMIT, additional_properties: nil)
      @account_number = account_number if account_number != OMIT
      @additional_properties = additional_properties
      @_field_set = { "accountNumber": account_number }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetAccountNumberResponse
    #
    # @param json_object [String]
    # @return [Pinnacle::GetAccountNumberResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      account_number = parsed_json["accountNumber"]
      new(account_number: account_number, additional_properties: struct)
    end

    # Serialize an instance of GetAccountNumberResponse to a JSON object
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
      obj.account_number&.is_a?(String) != false || raise("Passed value for field obj.account_number is not the expected type, validation failed.")
    end
  end
end
