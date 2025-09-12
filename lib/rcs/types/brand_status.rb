# frozen_string_literal: true

require_relative "brand_status_enum"
require "ostruct"
require "json"

module Pinnacle
  # Response for get brand status.
  class BrandStatus
    # @return [Array<String>] List of errors that occurred.
    attr_reader :errors
    # @return [Integer] Id of the brand.
    attr_reader :id
    # @return [Pinnacle::BrandStatusEnum] Current review status of the brand. <br>
    #  `INCOMPLETE`: Has not been submitted. Use the [submit
    #  endpoint](../brands/submit). <br>
    #  `PENDING`: Currently being reviewed. <br>
    #  `VERIFIED`: Verified and good to go. <br>
    #  `UNVERIFIED`: No longer verified due to an update in the brand details. Requires
    #  vetting to be reverified. <br>
    #  `VETTED`: Brand has been vetted by an external provider and has received vetting
    #  scores. <br>
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<String>] List of errors that occurred.
    # @param id [Integer] Id of the brand.
    # @param status [Pinnacle::BrandStatusEnum] Current review status of the brand. <br>
    #  `INCOMPLETE`: Has not been submitted. Use the [submit
    #  endpoint](../brands/submit). <br>
    #  `PENDING`: Currently being reviewed. <br>
    #  `VERIFIED`: Verified and good to go. <br>
    #  `UNVERIFIED`: No longer verified due to an update in the brand details. Requires
    #  vetting to be reverified. <br>
    #  `VETTED`: Brand has been vetted by an external provider and has received vetting
    #  scores. <br>
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::BrandStatus]
    def initialize(errors:, id:, status:, additional_properties: nil)
      @errors = errors
      @id = id
      @status = status
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "id": id, "status": status }
    end

    # Deserialize a JSON object to an instance of BrandStatus
    #
    # @param json_object [String]
    # @return [Pinnacle::BrandStatus]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]
      id = parsed_json["id"]
      status = parsed_json["status"]
      new(
        errors: errors,
        id: id,
        status: status,
        additional_properties: struct
      )
    end

    # Serialize an instance of BrandStatus to a JSON object
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
      obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.status.is_a?(Pinnacle::BrandStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
