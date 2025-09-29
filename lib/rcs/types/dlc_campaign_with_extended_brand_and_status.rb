# frozen_string_literal: true

require_relative "extended_brand"
require_relative "dlc_with_extended_brand_and_status_keywords"
require_relative "dlc_with_extended_brand_and_status_links"
require_relative "dlc_with_extended_brand_and_status_options"
require_relative "profile_status_enum"
require_relative "dlc_with_extended_brand_and_status_use_case"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Dlc campaign schema that includes extended brand and status.
    class DlcCampaignWithExtendedBrandAndStatus
      # @return [Boolean] Whether the campaign renews automatically.
      attr_reader :auto_renew
      # @return [Pinnacle::Types::ExtendedBrand] Brand associated with this campaign.
      attr_reader :brand
      # @return [Integer] Unique identifier for the campaign.
      attr_reader :campaign_id
      # @return [String] Description of the campaign.
      attr_reader :description
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords] Keyword response configuration.
      attr_reader :keywords
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusLinks] Legal documentation links.
      attr_reader :links
      # @return [String] Describe the flow of how users will opt in to this campaign.
      attr_reader :message_flow
      # @return [String] Display name of the campaign.
      attr_reader :name
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusOptions] Campaign configuration options.
      attr_reader :options
      # @return [Array<String>] Example messages for the campaign.
      attr_reader :sample_messages
      # @return [Pinnacle::Types::ProfileStatusEnum] Current review status of the campaign. <br>
      #  `INCOMPLETE`: Not submitted. <br>
      #  `IN REVIEW`: Being reviewed by carriers. <br>
      #  `VERIFIED`: Approved and ready to send messages. <br>
      #  `FAILED`: Issues and errors related to the campaign's details.
      attr_reader :status
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusUseCase] Use case for the campaign.
      attr_reader :use_case
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param auto_renew [Boolean] Whether the campaign renews automatically.
      # @param brand [Pinnacle::Types::ExtendedBrand] Brand associated with this campaign.
      # @param campaign_id [Integer] Unique identifier for the campaign.
      # @param description [String] Description of the campaign.
      # @param keywords [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords] Keyword response configuration.
      # @param links [Pinnacle::Types::DlcWithExtendedBrandAndStatusLinks] Legal documentation links.
      # @param message_flow [String] Describe the flow of how users will opt in to this campaign.
      # @param name [String] Display name of the campaign.
      # @param options [Pinnacle::Types::DlcWithExtendedBrandAndStatusOptions] Campaign configuration options.
      # @param sample_messages [Array<String>] Example messages for the campaign.
      # @param status [Pinnacle::Types::ProfileStatusEnum] Current review status of the campaign. <br>
      #  `INCOMPLETE`: Not submitted. <br>
      #  `IN REVIEW`: Being reviewed by carriers. <br>
      #  `VERIFIED`: Approved and ready to send messages. <br>
      #  `FAILED`: Issues and errors related to the campaign's details.
      # @param use_case [Pinnacle::Types::DlcWithExtendedBrandAndStatusUseCase] Use case for the campaign.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::DlcCampaignWithExtendedBrandAndStatus]
      def initialize(auto_renew:, brand:, keywords:, options:, status:, campaign_id: OMIT, description: OMIT, links: OMIT,
                     message_flow: OMIT, name: OMIT, sample_messages: OMIT, use_case: OMIT, additional_properties: nil)
        @auto_renew = auto_renew
        @brand = brand
        @campaign_id = campaign_id if campaign_id != OMIT
        @description = description if description != OMIT
        @keywords = keywords
        @links = links if links != OMIT
        @message_flow = message_flow if message_flow != OMIT
        @name = name if name != OMIT
        @options = options
        @sample_messages = sample_messages if sample_messages != OMIT
        @status = status
        @use_case = use_case if use_case != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "autoRenew": auto_renew,
          "brand": brand,
          "campaignId": campaign_id,
          "description": description,
          "keywords": keywords,
          "links": links,
          "messageFlow": message_flow,
          "name": name,
          "options": options,
          "sampleMessages": sample_messages,
          "status": status,
          "useCase": use_case
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of
      #  DlcCampaignWithExtendedBrandAndStatus
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::DlcCampaignWithExtendedBrandAndStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        auto_renew = parsed_json["autoRenew"]
        if parsed_json["brand"].nil?
          brand = nil
        else
          brand = parsed_json["brand"].to_json
          brand = Pinnacle::Types::ExtendedBrand.from_json(json_object: brand)
        end
        campaign_id = parsed_json["campaignId"]
        description = parsed_json["description"]
        if parsed_json["keywords"].nil?
          keywords = nil
        else
          keywords = parsed_json["keywords"].to_json
          keywords = Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords.from_json(json_object: keywords)
        end
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Pinnacle::Types::DlcWithExtendedBrandAndStatusLinks.from_json(json_object: links)
        end
        message_flow = parsed_json["messageFlow"]
        name = parsed_json["name"]
        if parsed_json["options"].nil?
          options = nil
        else
          options = parsed_json["options"].to_json
          options = Pinnacle::Types::DlcWithExtendedBrandAndStatusOptions.from_json(json_object: options)
        end
        sample_messages = parsed_json["sampleMessages"]
        status = parsed_json["status"]
        if parsed_json["useCase"].nil?
          use_case = nil
        else
          use_case = parsed_json["useCase"].to_json
          use_case = Pinnacle::Types::DlcWithExtendedBrandAndStatusUseCase.from_json(json_object: use_case)
        end
        new(
          auto_renew: auto_renew,
          brand: brand,
          campaign_id: campaign_id,
          description: description,
          keywords: keywords,
          links: links,
          message_flow: message_flow,
          name: name,
          options: options,
          sample_messages: sample_messages,
          status: status,
          use_case: use_case,
          additional_properties: struct
        )
      end

      # Serialize an instance of DlcCampaignWithExtendedBrandAndStatus to a JSON object
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
        obj.auto_renew.is_a?(Boolean) != false || raise("Passed value for field obj.auto_renew is not the expected type, validation failed.")
        Pinnacle::Types::ExtendedBrand.validate_raw(obj: obj.brand)
        obj.campaign_id&.is_a?(Integer) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords.validate_raw(obj: obj.keywords)
        obj.links.nil? || Pinnacle::Types::DlcWithExtendedBrandAndStatusLinks.validate_raw(obj: obj.links)
        obj.message_flow&.is_a?(String) != false || raise("Passed value for field obj.message_flow is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        Pinnacle::Types::DlcWithExtendedBrandAndStatusOptions.validate_raw(obj: obj.options)
        obj.sample_messages&.is_a?(Array) != false || raise("Passed value for field obj.sample_messages is not the expected type, validation failed.")
        obj.status.is_a?(Pinnacle::Types::ProfileStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.use_case.nil? || Pinnacle::Types::DlcWithExtendedBrandAndStatusUseCase.validate_raw(obj: obj.use_case)
      end
    end
  end
end
