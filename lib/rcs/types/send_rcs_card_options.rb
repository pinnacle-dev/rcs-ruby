# frozen_string_literal: true

require_relative "send_rcs_card_options_standalone_card"
require_relative "message_schedule"
require_relative "tracking"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class SendRcsCardOptions
      # @return [Pinnacle::Types::SendRcsCardOptionsStandaloneCard] Configure standalone card layout options for enhanced visual presentation.
      #  > **⚠️ Important Restriction**
      #  >
      #  > This option is **only valid for single card messages**. Using it with multiple
      #  cards will cause the request to fail with a validation error.
      attr_reader :standalone_card
      # @return [Pinnacle::Types::MessageSchedule]
      attr_reader :schedule
      # @return [Boolean] Send via the test agent to whitelisted test devices. Useful for development and
      #  debugging.
      attr_reader :test_mode
      # @return [Pinnacle::Types::Tracking]
      attr_reader :tracking
      # @return [Boolean] Media files and card media will be transcoded to a supported RCS format. This
      #  adds a small delay to sending the message. Ignored for rich text messages.
      attr_reader :transcode
      # @return [Boolean] Validate your message for any unsupported files. <br>
      #  If failed, errors will be thrown and the message will not send.
      attr_reader :validate
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param standalone_card [Pinnacle::Types::SendRcsCardOptionsStandaloneCard] Configure standalone card layout options for enhanced visual presentation.
      #  > **⚠️ Important Restriction**
      #  >
      #  > This option is **only valid for single card messages**. Using it with multiple
      #  cards will cause the request to fail with a validation error.
      # @param schedule [Pinnacle::Types::MessageSchedule]
      # @param test_mode [Boolean] Send via the test agent to whitelisted test devices. Useful for development and
      #  debugging.
      # @param tracking [Pinnacle::Types::Tracking]
      # @param transcode [Boolean] Media files and card media will be transcoded to a supported RCS format. This
      #  adds a small delay to sending the message. Ignored for rich text messages.
      # @param validate [Boolean] Validate your message for any unsupported files. <br>
      #  If failed, errors will be thrown and the message will not send.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SendRcsCardOptions]
      def initialize(standalone_card: OMIT, schedule: OMIT, test_mode: OMIT, tracking: OMIT, transcode: OMIT,
                     validate: OMIT, additional_properties: nil)
        @standalone_card = standalone_card if standalone_card != OMIT
        @schedule = schedule if schedule != OMIT
        @test_mode = test_mode if test_mode != OMIT
        @tracking = tracking if tracking != OMIT
        @transcode = transcode if transcode != OMIT
        @validate = validate if validate != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "standalone_card": standalone_card,
          "schedule": schedule,
          "test_mode": test_mode,
          "tracking": tracking,
          "transcode": transcode,
          "validate": validate
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of SendRcsCardOptions
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SendRcsCardOptions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["standalone_card"].nil?
          standalone_card = nil
        else
          standalone_card = parsed_json["standalone_card"].to_json
          standalone_card = Pinnacle::Types::SendRcsCardOptionsStandaloneCard.from_json(json_object: standalone_card)
        end
        if parsed_json["schedule"].nil?
          schedule = nil
        else
          schedule = parsed_json["schedule"].to_json
          schedule = Pinnacle::Types::MessageSchedule.from_json(json_object: schedule)
        end
        test_mode = parsed_json["test_mode"]
        tracking = parsed_json["tracking"]
        transcode = parsed_json["transcode"]
        validate = parsed_json["validate"]
        new(
          standalone_card: standalone_card,
          schedule: schedule,
          test_mode: test_mode,
          tracking: tracking,
          transcode: transcode,
          validate: validate,
          additional_properties: struct
        )
      end

      # Serialize an instance of SendRcsCardOptions to a JSON object
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
        obj.standalone_card.nil? || Pinnacle::Types::SendRcsCardOptionsStandaloneCard.validate_raw(obj: obj.standalone_card)
        obj.schedule.nil? || Pinnacle::Types::MessageSchedule.validate_raw(obj: obj.schedule)
        obj.test_mode&.is_a?(Boolean) != false || raise("Passed value for field obj.test_mode is not the expected type, validation failed.")
        obj.tracking&.is_a?(Pinnacle::Types::Tracking) != false || raise("Passed value for field obj.tracking is not the expected type, validation failed.")
        obj.transcode&.is_a?(Boolean) != false || raise("Passed value for field obj.transcode is not the expected type, validation failed.")
        obj.validate&.is_a?(Boolean) != false || raise("Passed value for field obj.validate is not the expected type, validation failed.")
      end
    end
  end
end
