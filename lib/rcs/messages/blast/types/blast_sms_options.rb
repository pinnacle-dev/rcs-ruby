# frozen_string_literal: true

require_relative "../../../types/message_schedule"
require "ostruct"
require "json"

module Pinnacle
  module Messages
    module Blast
      module Types
        # Additional settings to customize SMS blast delivery.
        class BlastSmsOptions
          # @return [Pinnacle::Types::MessageSchedule]
          attr_reader :schedule
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param schedule [Pinnacle::Types::MessageSchedule]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Messages::Blast::Types::BlastSmsOptions]
          def initialize(schedule: OMIT, additional_properties: nil)
            @schedule = schedule if schedule != OMIT
            @additional_properties = additional_properties
            @_field_set = { "schedule": schedule }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of BlastSmsOptions
          #
          # @param json_object [String]
          # @return [Pinnacle::Messages::Blast::Types::BlastSmsOptions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["schedule"].nil?
              schedule = nil
            else
              schedule = parsed_json["schedule"].to_json
              schedule = Pinnacle::Types::MessageSchedule.from_json(json_object: schedule)
            end
            new(schedule: schedule, additional_properties: struct)
          end

          # Serialize an instance of BlastSmsOptions to a JSON object
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
            obj.schedule.nil? || Pinnacle::Types::MessageSchedule.validate_raw(obj: obj.schedule)
          end
        end
      end
    end
  end
end
