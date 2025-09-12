# frozen_string_literal: true

require_relative "../../../types/message_schedule"
require_relative "../../../types/tracking"
require "ostruct"
require "json"

module Pinnacle
  module Messages
    module Send
      module Types
        # Control how your MMS is processed and delivered.
        class SendMmsSchemaOptions
          # @return [Boolean] Allow splitting large content into multiple MMS messages if size limits are
          #  exceeded. <br>
          #  If `false`, MMS over the limit will throw an error and won't be sent.
          attr_reader :multiple_messages
          # @return [Pinnacle::Types::MessageSchedule]
          attr_reader :schedule
          # @return [Pinnacle::Types::Tracking]
          attr_reader :tracking
          # @return [Boolean] Set to true to check this message and throw an error when validation fails. <br>
          #  If errors occur, the message is not sent. Otherwise message is sent after
          #  validation.
          attr_reader :validate
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param multiple_messages [Boolean] Allow splitting large content into multiple MMS messages if size limits are
          #  exceeded. <br>
          #  If `false`, MMS over the limit will throw an error and won't be sent.
          # @param schedule [Pinnacle::Types::MessageSchedule]
          # @param tracking [Pinnacle::Types::Tracking]
          # @param validate [Boolean] Set to true to check this message and throw an error when validation fails. <br>
          #  If errors occur, the message is not sent. Otherwise message is sent after
          #  validation.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Messages::Send::Types::SendMmsSchemaOptions]
          def initialize(multiple_messages:, validate:, schedule: OMIT, tracking: OMIT, additional_properties: nil)
            @multiple_messages = multiple_messages
            @schedule = schedule if schedule != OMIT
            @tracking = tracking if tracking != OMIT
            @validate = validate
            @additional_properties = additional_properties
            @_field_set = {
              "multiple_messages": multiple_messages,
              "schedule": schedule,
              "tracking": tracking,
              "validate": validate
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of SendMmsSchemaOptions
          #
          # @param json_object [String]
          # @return [Pinnacle::Messages::Send::Types::SendMmsSchemaOptions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            multiple_messages = parsed_json["multiple_messages"]
            if parsed_json["schedule"].nil?
              schedule = nil
            else
              schedule = parsed_json["schedule"].to_json
              schedule = Pinnacle::Types::MessageSchedule.from_json(json_object: schedule)
            end
            tracking = parsed_json["tracking"]
            validate = parsed_json["validate"]
            new(
              multiple_messages: multiple_messages,
              schedule: schedule,
              tracking: tracking,
              validate: validate,
              additional_properties: struct
            )
          end

          # Serialize an instance of SendMmsSchemaOptions to a JSON object
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
            obj.multiple_messages.is_a?(Boolean) != false || raise("Passed value for field obj.multiple_messages is not the expected type, validation failed.")
            obj.schedule.nil? || Pinnacle::Types::MessageSchedule.validate_raw(obj: obj.schedule)
            obj.tracking&.is_a?(Pinnacle::Types::Tracking) != false || raise("Passed value for field obj.tracking is not the expected type, validation failed.")
            obj.validate.is_a?(Boolean) != false || raise("Passed value for field obj.validate is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
