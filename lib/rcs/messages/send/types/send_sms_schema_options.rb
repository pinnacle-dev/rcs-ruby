# frozen_string_literal: true

require_relative "../../../types/message_schedule"
require_relative "../../../types/tracking"
require "ostruct"
require "json"

module Pinnacle
  module Messages
    class Send
      # Additional settings to customize SMS delivery.
      class SendSmsSchemaOptions
        # @return [Pinnacle::MessageSchedule]
        attr_reader :schedule
        # @return [Pinnacle::Tracking]
        attr_reader :tracking
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param schedule [Pinnacle::MessageSchedule]
        # @param tracking [Pinnacle::Tracking]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Pinnacle::Messages::Send::SendSmsSchemaOptions]
        def initialize(schedule: OMIT, tracking: OMIT, additional_properties: nil)
          @schedule = schedule if schedule != OMIT
          @tracking = tracking if tracking != OMIT
          @additional_properties = additional_properties
          @_field_set = { "schedule": schedule, "tracking": tracking }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of SendSmsSchemaOptions
        #
        # @param json_object [String]
        # @return [Pinnacle::Messages::Send::SendSmsSchemaOptions]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["schedule"].nil?
            schedule = nil
          else
            schedule = parsed_json["schedule"].to_json
            schedule = Pinnacle::MessageSchedule.from_json(json_object: schedule)
          end
          tracking = parsed_json["tracking"]
          new(
            schedule: schedule,
            tracking: tracking,
            additional_properties: struct
          )
        end

        # Serialize an instance of SendSmsSchemaOptions to a JSON object
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
          obj.schedule.nil? || Pinnacle::MessageSchedule.validate_raw(obj: obj.schedule)
          obj.tracking&.is_a?(Pinnacle::Tracking) != false || raise("Passed value for field obj.tracking is not the expected type, validation failed.")
        end
      end
    end
  end
end
