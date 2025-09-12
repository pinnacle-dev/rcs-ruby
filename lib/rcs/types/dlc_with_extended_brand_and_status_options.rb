# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Campaign configuration options.
  class DlcWithExtendedBrandAndStatusOptions
    # @return [Boolean] Whether the campaign uses affiliate marketing.
    attr_reader :affiliate_marketing
    # @return [Boolean] Whether the campaign is age-gated.
    attr_reader :age_gated
    # @return [Boolean] Whether the campaign involves direct lending.
    attr_reader :direct_lending
    # @return [String] Link embedded in campaign message.
    attr_reader :embedded_link
    # @return [Boolean] Whether messages include phone numbers.
    attr_reader :embedded_phone
    # @return [Boolean] Whether the campaign uses number pooling.
    attr_reader :number_pooling
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param affiliate_marketing [Boolean] Whether the campaign uses affiliate marketing.
    # @param age_gated [Boolean] Whether the campaign is age-gated.
    # @param direct_lending [Boolean] Whether the campaign involves direct lending.
    # @param embedded_link [String] Link embedded in campaign message.
    # @param embedded_phone [Boolean] Whether messages include phone numbers.
    # @param number_pooling [Boolean] Whether the campaign uses number pooling.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::DlcWithExtendedBrandAndStatusOptions]
    def initialize(affiliate_marketing:, age_gated:, direct_lending:, embedded_phone:, number_pooling:,
                   embedded_link: OMIT, additional_properties: nil)
      @affiliate_marketing = affiliate_marketing
      @age_gated = age_gated
      @direct_lending = direct_lending
      @embedded_link = embedded_link if embedded_link != OMIT
      @embedded_phone = embedded_phone
      @number_pooling = number_pooling
      @additional_properties = additional_properties
      @_field_set = {
        "affiliateMarketing": affiliate_marketing,
        "ageGated": age_gated,
        "directLending": direct_lending,
        "embeddedLink": embedded_link,
        "embeddedPhone": embedded_phone,
        "numberPooling": number_pooling
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of DlcWithExtendedBrandAndStatusOptions
    #
    # @param json_object [String]
    # @return [Pinnacle::DlcWithExtendedBrandAndStatusOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      affiliate_marketing = parsed_json["affiliateMarketing"]
      age_gated = parsed_json["ageGated"]
      direct_lending = parsed_json["directLending"]
      embedded_link = parsed_json["embeddedLink"]
      embedded_phone = parsed_json["embeddedPhone"]
      number_pooling = parsed_json["numberPooling"]
      new(
        affiliate_marketing: affiliate_marketing,
        age_gated: age_gated,
        direct_lending: direct_lending,
        embedded_link: embedded_link,
        embedded_phone: embedded_phone,
        number_pooling: number_pooling,
        additional_properties: struct
      )
    end

    # Serialize an instance of DlcWithExtendedBrandAndStatusOptions to a JSON object
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
      obj.affiliate_marketing.is_a?(Boolean) != false || raise("Passed value for field obj.affiliate_marketing is not the expected type, validation failed.")
      obj.age_gated.is_a?(Boolean) != false || raise("Passed value for field obj.age_gated is not the expected type, validation failed.")
      obj.direct_lending.is_a?(Boolean) != false || raise("Passed value for field obj.direct_lending is not the expected type, validation failed.")
      obj.embedded_link&.is_a?(String) != false || raise("Passed value for field obj.embedded_link is not the expected type, validation failed.")
      obj.embedded_phone.is_a?(Boolean) != false || raise("Passed value for field obj.embedded_phone is not the expected type, validation failed.")
      obj.number_pooling.is_a?(Boolean) != false || raise("Passed value for field obj.number_pooling is not the expected type, validation failed.")
    end
  end
end
