# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsCampaignTraffic
          # @return [Integer] Estimated monthly website visitors.
          attr_reader :monthly_website
          # @return [Integer] Estimated monthly RCS messages sent.
          attr_reader :monthly_rcs_estimate
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param monthly_website [Integer] Estimated monthly website visitors.
          # @param monthly_rcs_estimate [Integer] Estimated monthly RCS messages sent.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignTraffic]
          def initialize(monthly_website: OMIT, monthly_rcs_estimate: OMIT, additional_properties: nil)
            @monthly_website = monthly_website if monthly_website != OMIT
            @monthly_rcs_estimate = monthly_rcs_estimate if monthly_rcs_estimate != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "monthlyWebsite": monthly_website,
              "monthlyRcsEstimate": monthly_rcs_estimate
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of RcsCampaignTraffic
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignTraffic]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            monthly_website = parsed_json["monthlyWebsite"]
            monthly_rcs_estimate = parsed_json["monthlyRcsEstimate"]
            new(
              monthly_website: monthly_website,
              monthly_rcs_estimate: monthly_rcs_estimate,
              additional_properties: struct
            )
          end

          # Serialize an instance of RcsCampaignTraffic to a JSON object
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
            obj.monthly_website&.is_a?(Integer) != false || raise("Passed value for field obj.monthly_website is not the expected type, validation failed.")
            obj.monthly_rcs_estimate&.is_a?(Integer) != false || raise("Passed value for field obj.monthly_rcs_estimate is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
