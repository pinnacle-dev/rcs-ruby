# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Messaging
    # @return [String] Explain how users will opt in to receive messages.
    attr_reader :opt_in
    # @return [String] Explain how users will opt out of receiving messages.
    attr_reader :opt_out
    # @return [Array<String>] Please provide the unique keywords to opt out. Each keyword should not contain
    #  spaces.
    attr_reader :opt_out_keywords
    # @return [String] Please define what your agent will do.
    attr_reader :agent_use_case
    # @return [String] Please provide some example messages that your agent will send.
    attr_reader :expected_agent_responses
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param opt_in [String] Explain how users will opt in to receive messages.
    # @param opt_out [String] Explain how users will opt out of receiving messages.
    # @param opt_out_keywords [Array<String>] Please provide the unique keywords to opt out. Each keyword should not contain
    #  spaces.
    # @param agent_use_case [String] Please define what your agent will do.
    # @param expected_agent_responses [String] Please provide some example messages that your agent will send.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Messaging]
    def initialize(opt_in:, opt_out:, opt_out_keywords:, agent_use_case:, expected_agent_responses:,
                   additional_properties: nil)
      @opt_in = opt_in
      @opt_out = opt_out
      @opt_out_keywords = opt_out_keywords
      @agent_use_case = agent_use_case
      @expected_agent_responses = expected_agent_responses
      @additional_properties = additional_properties
      @_field_set = {
        "optIn": opt_in,
        "optOut": opt_out,
        "optOutKeywords": opt_out_keywords,
        "agentUseCase": agent_use_case,
        "expectedAgentResponses": expected_agent_responses
      }
    end

    # Deserialize a JSON object to an instance of Messaging
    #
    # @param json_object [String]
    # @return [Pinnacle::Messaging]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      opt_in = parsed_json["optIn"]
      opt_out = parsed_json["optOut"]
      opt_out_keywords = parsed_json["optOutKeywords"]
      agent_use_case = parsed_json["agentUseCase"]
      expected_agent_responses = parsed_json["expectedAgentResponses"]
      new(
        opt_in: opt_in,
        opt_out: opt_out,
        opt_out_keywords: opt_out_keywords,
        agent_use_case: agent_use_case,
        expected_agent_responses: expected_agent_responses,
        additional_properties: struct
      )
    end

    # Serialize an instance of Messaging to a JSON object
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
      obj.opt_in.is_a?(String) != false || raise("Passed value for field obj.opt_in is not the expected type, validation failed.")
      obj.opt_out.is_a?(String) != false || raise("Passed value for field obj.opt_out is not the expected type, validation failed.")
      obj.opt_out_keywords.is_a?(Array) != false || raise("Passed value for field obj.opt_out_keywords is not the expected type, validation failed.")
      obj.agent_use_case.is_a?(String) != false || raise("Passed value for field obj.agent_use_case is not the expected type, validation failed.")
      obj.expected_agent_responses.is_a?(String) != false || raise("Passed value for field obj.expected_agent_responses is not the expected type, validation failed.")
    end
  end
end
