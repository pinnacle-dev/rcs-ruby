# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Tools
    class File
      # Configure download settings for your uploaded file.
      class FileUploadSchemaOptionsDownload
        # @return [String] Set an expiration date for file download access.<br>
        #  If this field is not provided, then a short permalink is generated instead.
        attr_reader :expires_at
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param expires_at [String] Set an expiration date for file download access.<br>
        #  If this field is not provided, then a short permalink is generated instead.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Pinnacle::Tools::File::FileUploadSchemaOptionsDownload]
        def initialize(expires_at: OMIT, additional_properties: nil)
          @expires_at = expires_at if expires_at != OMIT
          @additional_properties = additional_properties
          @_field_set = { "expiresAt": expires_at }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of FileUploadSchemaOptionsDownload
        #
        # @param json_object [String]
        # @return [Pinnacle::Tools::File::FileUploadSchemaOptionsDownload]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          expires_at = parsed_json["expiresAt"]
          new(expires_at: expires_at, additional_properties: struct)
        end

        # Serialize an instance of FileUploadSchemaOptionsDownload to a JSON object
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
          obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
        end
      end
    end
  end
end
