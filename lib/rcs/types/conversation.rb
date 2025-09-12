# frozen_string_literal: true

require_relative "campaign_query"
require_relative "conversation_contact"
require_relative "conversation_sender"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Conversation that was found.
    class Conversation
      # @return [Integer] Identifier for the brand associated with this conversation.
      attr_reader :brand_id
      # @return [Pinnacle::Types::CampaignQuery] Campaign information if this conversation is part of a marketing campaign.
      attr_reader :campaign
      # @return [Pinnacle::Types::ConversationContact] Contact information for the recipient in a conversation.
      attr_reader :contact
      # @return [String] ISO 8601 timestamp when the conversation was created.
      attr_reader :created_at
      # @return [Integer] Unique identifier for the conversation.
      attr_reader :id
      # @return [String] Free-form notes or comments about the conversation.
      attr_reader :notes
      # @return [Pinnacle::Types::ConversationSender] The sender of messages in this conversation. Can be:
      #  - A phone number with its capabilities and metadata
      #  - An RCS agent with ID and name
      #  - `null` if no sender is associated
      attr_reader :sender
      # @return [String] ISO 8601 timestamp when the conversation was last updated.
      attr_reader :updated_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param brand_id [Integer] Identifier for the brand associated with this conversation.
      # @param campaign [Pinnacle::Types::CampaignQuery] Campaign information if this conversation is part of a marketing campaign.
      # @param contact [Pinnacle::Types::ConversationContact] Contact information for the recipient in a conversation.
      # @param created_at [String] ISO 8601 timestamp when the conversation was created.
      # @param id [Integer] Unique identifier for the conversation.
      # @param notes [String] Free-form notes or comments about the conversation.
      # @param sender [Pinnacle::Types::ConversationSender] The sender of messages in this conversation. Can be:
      #  - A phone number with its capabilities and metadata
      #  - An RCS agent with ID and name
      #  - `null` if no sender is associated
      # @param updated_at [String] ISO 8601 timestamp when the conversation was last updated.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::Conversation]
      def initialize(contact:, created_at:, id:, notes:, updated_at:, brand_id: OMIT, campaign: OMIT, sender: OMIT,
                     additional_properties: nil)
        @brand_id = brand_id if brand_id != OMIT
        @campaign = campaign if campaign != OMIT
        @contact = contact
        @created_at = created_at
        @id = id
        @notes = notes
        @sender = sender if sender != OMIT
        @updated_at = updated_at
        @additional_properties = additional_properties
        @_field_set = {
          "brandId": brand_id,
          "campaign": campaign,
          "contact": contact,
          "createdAt": created_at,
          "id": id,
          "notes": notes,
          "sender": sender,
          "updatedAt": updated_at
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Conversation
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::Conversation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        brand_id = parsed_json["brandId"]
        if parsed_json["campaign"].nil?
          campaign = nil
        else
          campaign = parsed_json["campaign"].to_json
          campaign = Pinnacle::Types::CampaignQuery.from_json(json_object: campaign)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Pinnacle::Types::ConversationContact.from_json(json_object: contact)
        end
        created_at = parsed_json["createdAt"]
        id = parsed_json["id"]
        notes = parsed_json["notes"]
        if parsed_json["sender"].nil?
          sender = nil
        else
          sender = parsed_json["sender"].to_json
          sender = Pinnacle::Types::ConversationSender.from_json(json_object: sender)
        end
        updated_at = parsed_json["updatedAt"]
        new(
          brand_id: brand_id,
          campaign: campaign,
          contact: contact,
          created_at: created_at,
          id: id,
          notes: notes,
          sender: sender,
          updated_at: updated_at,
          additional_properties: struct
        )
      end

      # Serialize an instance of Conversation to a JSON object
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
        obj.brand_id&.is_a?(Integer) != false || raise("Passed value for field obj.brand_id is not the expected type, validation failed.")
        obj.campaign.nil? || Pinnacle::Types::CampaignQuery.validate_raw(obj: obj.campaign)
        Pinnacle::Types::ConversationContact.validate_raw(obj: obj.contact)
        obj.created_at.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.notes.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
        obj.sender.nil? || Pinnacle::Types::ConversationSender.validate_raw(obj: obj.sender)
        obj.updated_at.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      end
    end
  end
end
