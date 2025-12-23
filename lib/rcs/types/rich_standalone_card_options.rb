# frozen_string_literal: true

require_relative "send_rcs_card_options_standalone_card_orientation"
require_relative "send_rcs_card_options_standalone_card_image_alignment"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Configure standalone card layout options for enhanced visual presentation.
    #  > **⚠️ Important Restriction**
    #  >
    #  > This option is **only valid for single card messages** with static media.
    #  Using it with multiple cards will cause the request to fail with a validation
    #  error.
    #  > GIFs and videos are not supported and will be rendered as vertical cards.
    class RichStandaloneCardOptions
      # @return [Pinnacle::Types::SendRcsCardOptionsStandaloneCardOrientation] The orientation of the standalone card.
      attr_reader :orientation
      # @return [Pinnacle::Types::SendRcsCardOptionsStandaloneCardImageAlignment] The alignment of the image in the standalone card. This field is ignored if
      #  orientation is VERTICAL.
      attr_reader :image_alignment
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param orientation [Pinnacle::Types::SendRcsCardOptionsStandaloneCardOrientation] The orientation of the standalone card.
      # @param image_alignment [Pinnacle::Types::SendRcsCardOptionsStandaloneCardImageAlignment] The alignment of the image in the standalone card. This field is ignored if
      #  orientation is VERTICAL.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RichStandaloneCardOptions]
      def initialize(orientation: OMIT, image_alignment: OMIT, additional_properties: nil)
        @orientation = orientation if orientation != OMIT
        @image_alignment = image_alignment if image_alignment != OMIT
        @additional_properties = additional_properties
        @_field_set = { "orientation": orientation, "image_alignment": image_alignment }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RichStandaloneCardOptions
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RichStandaloneCardOptions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        orientation = parsed_json["orientation"]
        image_alignment = parsed_json["image_alignment"]
        new(
          orientation: orientation,
          image_alignment: image_alignment,
          additional_properties: struct
        )
      end

      # Serialize an instance of RichStandaloneCardOptions to a JSON object
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
        obj.orientation&.is_a?(Pinnacle::Types::SendRcsCardOptionsStandaloneCardOrientation) != false || raise("Passed value for field obj.orientation is not the expected type, validation failed.")
        obj.image_alignment&.is_a?(Pinnacle::Types::SendRcsCardOptionsStandaloneCardImageAlignment) != false || raise("Passed value for field obj.image_alignment is not the expected type, validation failed.")
      end
    end
  end
end
