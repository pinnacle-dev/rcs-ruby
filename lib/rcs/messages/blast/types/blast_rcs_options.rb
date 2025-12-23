# frozen_string_literal: true

require_relative "blast_rcs_request_options_standalone_card"
require_relative "../../../types/message_schedule"
require "ostruct"
require "json"

module Pinnacle
  module Messages
    module Blast
      module Types
        # Configure how your RCS blast is sent and tracked.
        class BlastRcsOptions
          # @return [Boolean] Media files and card media will be transcoded to a supported RCS format. This
          #  adds a small delay to sending the message. Ignored for rich text messages.
          attr_reader :transcode
          # @return [Boolean] Validate your message for any unsupported files. <br>
          #  If failed, errors will be thrown and the blast will not be sent.
          attr_reader :validate
          # @return [Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCard] Configure standalone card layout options for enhanced visual presentation.
          #  > **⚠️ Important Restriction**
          #  >
          #  > This option is **only valid for single card messages**. Using it with multiple
          #  cards will cause the request to fail with a validation error.
          attr_reader :standalone_card
          # @return [Pinnacle::Types::MessageSchedule]
          attr_reader :schedule
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param transcode [Boolean] Media files and card media will be transcoded to a supported RCS format. This
          #  adds a small delay to sending the message. Ignored for rich text messages.
          # @param validate [Boolean] Validate your message for any unsupported files. <br>
          #  If failed, errors will be thrown and the blast will not be sent.
          # @param standalone_card [Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCard] Configure standalone card layout options for enhanced visual presentation.
          #  > **⚠️ Important Restriction**
          #  >
          #  > This option is **only valid for single card messages**. Using it with multiple
          #  cards will cause the request to fail with a validation error.
          # @param schedule [Pinnacle::Types::MessageSchedule]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Messages::Blast::Types::BlastRcsOptions]
          def initialize(transcode: OMIT, validate: OMIT, standalone_card: OMIT, schedule: OMIT,
                         additional_properties: nil)
            @transcode = transcode if transcode != OMIT
            @validate = validate if validate != OMIT
            @standalone_card = standalone_card if standalone_card != OMIT
            @schedule = schedule if schedule != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "transcode": transcode,
              "validate": validate,
              "standalone_card": standalone_card,
              "schedule": schedule
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of BlastRcsOptions
          #
          # @param json_object [String]
          # @return [Pinnacle::Messages::Blast::Types::BlastRcsOptions]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            transcode = parsed_json["transcode"]
            validate = parsed_json["validate"]
            if parsed_json["standalone_card"].nil?
              standalone_card = nil
            else
              standalone_card = parsed_json["standalone_card"].to_json
              standalone_card = Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCard.from_json(json_object: standalone_card)
            end
            if parsed_json["schedule"].nil?
              schedule = nil
            else
              schedule = parsed_json["schedule"].to_json
              schedule = Pinnacle::Types::MessageSchedule.from_json(json_object: schedule)
            end
            new(
              transcode: transcode,
              validate: validate,
              standalone_card: standalone_card,
              schedule: schedule,
              additional_properties: struct
            )
          end

          # Serialize an instance of BlastRcsOptions to a JSON object
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
            obj.transcode&.is_a?(Boolean) != false || raise("Passed value for field obj.transcode is not the expected type, validation failed.")
            obj.validate&.is_a?(Boolean) != false || raise("Passed value for field obj.validate is not the expected type, validation failed.")
            obj.standalone_card.nil? || Pinnacle::Messages::Blast::Types::BlastRcsRequestOptionsStandaloneCard.validate_raw(obj: obj.standalone_card)
            obj.schedule.nil? || Pinnacle::Types::MessageSchedule.validate_raw(obj: obj.schedule)
          end
        end
      end
    end
  end
end
