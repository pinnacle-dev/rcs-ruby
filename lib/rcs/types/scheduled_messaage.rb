# frozen_string_literal: true

require_relative "scheduled_send_response_config"
require "ostruct"
require "json"

module Pinnacle
  class ScheduledMessaage
    # @return [Integer] Unique identifier for the scheduled send.
    attr_reader :schedule_id
    # @return [Pinnacle::ScheduledSendResponseConfig] Configuration for the scheduled message.
    attr_reader :config
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param schedule_id [Integer] Unique identifier for the scheduled send.
    # @param config [Pinnacle::ScheduledSendResponseConfig] Configuration for the scheduled message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::ScheduledMessaage]
    def initialize(schedule_id:, config:, additional_properties: nil)
      @schedule_id = schedule_id
      @config = config
      @additional_properties = additional_properties
      @_field_set = { "scheduleId": schedule_id, "config": config }
    end

    # Deserialize a JSON object to an instance of ScheduledMessaage
    #
    # @param json_object [String]
    # @return [Pinnacle::ScheduledMessaage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      schedule_id = parsed_json["scheduleId"]
      if parsed_json["config"].nil?
        config = nil
      else
        config = parsed_json["config"].to_json
        config = Pinnacle::ScheduledSendResponseConfig.from_json(json_object: config)
      end
      new(
        schedule_id: schedule_id,
        config: config,
        additional_properties: struct
      )
    end

    # Serialize an instance of ScheduledMessaage to a JSON object
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
      obj.schedule_id.is_a?(Integer) != false || raise("Passed value for field obj.schedule_id is not the expected type, validation failed.")
      Pinnacle::ScheduledSendResponseConfig.validate_raw(obj: obj.config)
    end
  end
end
