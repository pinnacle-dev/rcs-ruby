# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class RcsFunctionalities
    # @return [Boolean] Indicates if RCS is enabled.
    attr_reader :is_enabled
    # @return [Boolean] Indicates if standalone rich cards are supported.
    attr_reader :standalone_rich_card
    # @return [Boolean] Indicates if carousel rich cards are supported.
    attr_reader :carousel_rich_card
    # @return [Boolean] Indicates if buttons to create a calendar event are supported.
    attr_reader :create_calendar_event_action
    # @return [Boolean] Indicates if dial buttons are supported.
    attr_reader :dial_action
    # @return [Boolean] Indicates if open URL buttons are supported.
    attr_reader :open_url_action
    # @return [Boolean] Indicates if share location buttons are supported.
    attr_reader :share_location_action
    # @return [Boolean] Indicates if view location buttons are supported.
    attr_reader :view_location_action
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param is_enabled [Boolean] Indicates if RCS is enabled.
    # @param standalone_rich_card [Boolean] Indicates if standalone rich cards are supported.
    # @param carousel_rich_card [Boolean] Indicates if carousel rich cards are supported.
    # @param create_calendar_event_action [Boolean] Indicates if buttons to create a calendar event are supported.
    # @param dial_action [Boolean] Indicates if dial buttons are supported.
    # @param open_url_action [Boolean] Indicates if open URL buttons are supported.
    # @param share_location_action [Boolean] Indicates if share location buttons are supported.
    # @param view_location_action [Boolean] Indicates if view location buttons are supported.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsFunctionalities]
    def initialize(is_enabled:, standalone_rich_card:, carousel_rich_card:, create_calendar_event_action:,
                   dial_action:, open_url_action:, share_location_action:, view_location_action:, additional_properties: nil)
      @is_enabled = is_enabled
      @standalone_rich_card = standalone_rich_card
      @carousel_rich_card = carousel_rich_card
      @create_calendar_event_action = create_calendar_event_action
      @dial_action = dial_action
      @open_url_action = open_url_action
      @share_location_action = share_location_action
      @view_location_action = view_location_action
      @additional_properties = additional_properties
      @_field_set = {
        "is_enabled": is_enabled,
        "standalone_rich_card": standalone_rich_card,
        "carousel_rich_card": carousel_rich_card,
        "create_calendar_event_action": create_calendar_event_action,
        "dial_action": dial_action,
        "open_url_action": open_url_action,
        "share_location_action": share_location_action,
        "view_location_action": view_location_action
      }
    end

    # Deserialize a JSON object to an instance of RcsFunctionalities
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsFunctionalities]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      is_enabled = parsed_json["is_enabled"]
      standalone_rich_card = parsed_json["standalone_rich_card"]
      carousel_rich_card = parsed_json["carousel_rich_card"]
      create_calendar_event_action = parsed_json["create_calendar_event_action"]
      dial_action = parsed_json["dial_action"]
      open_url_action = parsed_json["open_url_action"]
      share_location_action = parsed_json["share_location_action"]
      view_location_action = parsed_json["view_location_action"]
      new(
        is_enabled: is_enabled,
        standalone_rich_card: standalone_rich_card,
        carousel_rich_card: carousel_rich_card,
        create_calendar_event_action: create_calendar_event_action,
        dial_action: dial_action,
        open_url_action: open_url_action,
        share_location_action: share_location_action,
        view_location_action: view_location_action,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsFunctionalities to a JSON object
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
      obj.is_enabled.is_a?(Boolean) != false || raise("Passed value for field obj.is_enabled is not the expected type, validation failed.")
      obj.standalone_rich_card.is_a?(Boolean) != false || raise("Passed value for field obj.standalone_rich_card is not the expected type, validation failed.")
      obj.carousel_rich_card.is_a?(Boolean) != false || raise("Passed value for field obj.carousel_rich_card is not the expected type, validation failed.")
      obj.create_calendar_event_action.is_a?(Boolean) != false || raise("Passed value for field obj.create_calendar_event_action is not the expected type, validation failed.")
      obj.dial_action.is_a?(Boolean) != false || raise("Passed value for field obj.dial_action is not the expected type, validation failed.")
      obj.open_url_action.is_a?(Boolean) != false || raise("Passed value for field obj.open_url_action is not the expected type, validation failed.")
      obj.share_location_action.is_a?(Boolean) != false || raise("Passed value for field obj.share_location_action is not the expected type, validation failed.")
      obj.view_location_action.is_a?(Boolean) != false || raise("Passed value for field obj.view_location_action is not the expected type, validation failed.")
    end
  end
end
