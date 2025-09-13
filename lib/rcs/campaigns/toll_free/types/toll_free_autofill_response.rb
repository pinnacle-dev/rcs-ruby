# frozen_string_literal: true

require_relative "../../../types/message_volume_enum"
require_relative "../../../types/upsert_toll_free_campaign_opt_in"
require_relative "../../../types/upsert_toll_free_campaign_use_case"
require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        class TollFreeAutofillResponse
          # @return [Integer]
          attr_reader :brand
          # @return [Integer] Unique identifier for the campaign.
          attr_reader :campaign_id
          # @return [Pinnacle::Types::MessageVolumeEnum]
          attr_reader :monthly_volume
          # @return [String] Display name of the campaign.
          attr_reader :name
          # @return [Pinnacle::Types::UpsertTollFreeCampaignOptIn] Opt-in keyword settings.
          attr_reader :opt_in
          # @return [String] Explain message that would be sent.
          attr_reader :production_message_content
          # @return [Pinnacle::Types::UpsertTollFreeCampaignUseCase] Use case classification for the campaign.
          attr_reader :use_case
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param brand [Integer]
          # @param campaign_id [Integer] Unique identifier for the campaign.
          # @param monthly_volume [Pinnacle::Types::MessageVolumeEnum]
          # @param name [String] Display name of the campaign.
          # @param opt_in [Pinnacle::Types::UpsertTollFreeCampaignOptIn] Opt-in keyword settings.
          # @param production_message_content [String] Explain message that would be sent.
          # @param use_case [Pinnacle::Types::UpsertTollFreeCampaignUseCase] Use case classification for the campaign.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse]
          def initialize(brand: OMIT, campaign_id: OMIT, monthly_volume: OMIT, name: OMIT, opt_in: OMIT,
                         production_message_content: OMIT, use_case: OMIT, additional_properties: nil)
            @brand = brand if brand != OMIT
            @campaign_id = campaign_id if campaign_id != OMIT
            @monthly_volume = monthly_volume if monthly_volume != OMIT
            @name = name if name != OMIT
            @opt_in = opt_in if opt_in != OMIT
            @production_message_content = production_message_content if production_message_content != OMIT
            @use_case = use_case if use_case != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "brand": brand,
              "campaignId": campaign_id,
              "monthlyVolume": monthly_volume,
              "name": name,
              "optIn": opt_in,
              "productionMessageContent": production_message_content,
              "useCase": use_case
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TollFreeAutofillResponse
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeAutofillResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            brand = parsed_json["brand"]
            campaign_id = parsed_json["campaignId"]
            monthly_volume = parsed_json["monthlyVolume"]
            name = parsed_json["name"]
            if parsed_json["optIn"].nil?
              opt_in = nil
            else
              opt_in = parsed_json["optIn"].to_json
              opt_in = Pinnacle::Types::UpsertTollFreeCampaignOptIn.from_json(json_object: opt_in)
            end
            production_message_content = parsed_json["productionMessageContent"]
            if parsed_json["useCase"].nil?
              use_case = nil
            else
              use_case = parsed_json["useCase"].to_json
              use_case = Pinnacle::Types::UpsertTollFreeCampaignUseCase.from_json(json_object: use_case)
            end
            new(
              brand: brand,
              campaign_id: campaign_id,
              monthly_volume: monthly_volume,
              name: name,
              opt_in: opt_in,
              production_message_content: production_message_content,
              use_case: use_case,
              additional_properties: struct
            )
          end

          # Serialize an instance of TollFreeAutofillResponse to a JSON object
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
            obj.brand&.is_a?(Integer) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
            obj.campaign_id&.is_a?(Integer) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
            obj.monthly_volume&.is_a?(Pinnacle::Types::MessageVolumeEnum) != false || raise("Passed value for field obj.monthly_volume is not the expected type, validation failed.")
            obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.opt_in.nil? || Pinnacle::Types::UpsertTollFreeCampaignOptIn.validate_raw(obj: obj.opt_in)
            obj.production_message_content&.is_a?(String) != false || raise("Passed value for field obj.production_message_content is not the expected type, validation failed.")
            obj.use_case.nil? || Pinnacle::Types::UpsertTollFreeCampaignUseCase.validate_raw(obj: obj.use_case)
          end
        end
      end
    end
  end
end
