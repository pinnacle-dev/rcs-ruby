# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Information about an RCS agent sender in a conversation.
  class Agent
    # @return [String] Unique identifier for the RCS agent.
    attr_reader :agent_id
    # @return [String] Display name of the RCS agent.
    attr_reader :agent_name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param agent_id [String] Unique identifier for the RCS agent.
    # @param agent_name [String] Display name of the RCS agent.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Agent]
    def initialize(agent_id:, agent_name:, additional_properties: nil)
      @agent_id = agent_id
      @agent_name = agent_name
      @additional_properties = additional_properties
      @_field_set = { "agentId": agent_id, "agentName": agent_name }
    end

    # Deserialize a JSON object to an instance of Agent
    #
    # @param json_object [String]
    # @return [Pinnacle::Agent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      agent_id = parsed_json["agentId"]
      agent_name = parsed_json["agentName"]
      new(
        agent_id: agent_id,
        agent_name: agent_name,
        additional_properties: struct
      )
    end

    # Serialize an instance of Agent to a JSON object
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
      obj.agent_id.is_a?(String) != false || raise("Passed value for field obj.agent_id is not the expected type, validation failed.")
      obj.agent_name.is_a?(String) != false || raise("Passed value for field obj.agent_name is not the expected type, validation failed.")
    end
  end
end
