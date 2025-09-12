# frozen_string_literal: true

require_relative "v_card_data_file"
require_relative "v_card_name"
require_relative "vcard_address"
require_relative "vcard_phone"
require_relative "vcard_email"
require_relative "v_card_geo"
require_relative "v_card_organization"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class VCardData
      # @return [Pinnacle::Types::VCardDataFile] File associated to the contact.
      attr_reader :file
      # @return [String] ISO 8601 timestamp of last vCard update.
      attr_reader :revision
      # @return [Integer] Unique identifier for the contact.
      attr_reader :id
      # @return [String] Full display name for the vCard.
      attr_reader :formatted_name
      # @return [Pinnacle::Types::VCardName] Structured name components.
      attr_reader :name
      # @return [Array<String>] Nicknames or aliases.
      attr_reader :nickname
      # @return [String] Birthday in ISO 8601 date format (YYYY-MM-DD).
      attr_reader :birthday
      # @return [Array<Pinnacle::Types::VcardAddress>] Physical addresses.
      attr_reader :addresses
      # @return [String] Website URL.
      attr_reader :url
      # @return [Array<Pinnacle::Types::VcardPhone>] Phone numbers.
      attr_reader :phones
      # @return [Array<Pinnacle::Types::VcardEmail>] Email addresses.
      attr_reader :emails
      # @return [String] Timezone (e.g., "America/New_York").
      attr_reader :timezone
      # @return [Pinnacle::Types::VCardGeo] Geographic coordinates.
      attr_reader :geo
      # @return [String] Job title or position.
      attr_reader :title
      # @return [String] Role or function within the organization.
      attr_reader :role
      # @return [Pinnacle::Types::VCardOrganization] Organization or company information.
      attr_reader :organization
      # @return [Array<String>] Categories or tags for organizing contacts.
      attr_reader :categories
      # @return [String] Additional notes or comments.
      attr_reader :note
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param file [Pinnacle::Types::VCardDataFile] File associated to the contact.
      # @param revision [String] ISO 8601 timestamp of last vCard update.
      # @param id [Integer] Unique identifier for the contact.
      # @param formatted_name [String] Full display name for the vCard.
      # @param name [Pinnacle::Types::VCardName] Structured name components.
      # @param nickname [Array<String>] Nicknames or aliases.
      # @param birthday [String] Birthday in ISO 8601 date format (YYYY-MM-DD).
      # @param addresses [Array<Pinnacle::Types::VcardAddress>] Physical addresses.
      # @param url [String] Website URL.
      # @param phones [Array<Pinnacle::Types::VcardPhone>] Phone numbers.
      # @param emails [Array<Pinnacle::Types::VcardEmail>] Email addresses.
      # @param timezone [String] Timezone (e.g., "America/New_York").
      # @param geo [Pinnacle::Types::VCardGeo] Geographic coordinates.
      # @param title [String] Job title or position.
      # @param role [String] Role or function within the organization.
      # @param organization [Pinnacle::Types::VCardOrganization] Organization or company information.
      # @param categories [Array<String>] Categories or tags for organizing contacts.
      # @param note [String] Additional notes or comments.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::VCardData]
      def initialize(file:, revision: OMIT, id: OMIT, formatted_name: OMIT, name: OMIT, nickname: OMIT, birthday: OMIT,
                     addresses: OMIT, url: OMIT, phones: OMIT, emails: OMIT, timezone: OMIT, geo: OMIT, title: OMIT, role: OMIT, organization: OMIT, categories: OMIT, note: OMIT, additional_properties: nil)
        @file = file
        @revision = revision if revision != OMIT
        @id = id if id != OMIT
        @formatted_name = formatted_name if formatted_name != OMIT
        @name = name if name != OMIT
        @nickname = nickname if nickname != OMIT
        @birthday = birthday if birthday != OMIT
        @addresses = addresses if addresses != OMIT
        @url = url if url != OMIT
        @phones = phones if phones != OMIT
        @emails = emails if emails != OMIT
        @timezone = timezone if timezone != OMIT
        @geo = geo if geo != OMIT
        @title = title if title != OMIT
        @role = role if role != OMIT
        @organization = organization if organization != OMIT
        @categories = categories if categories != OMIT
        @note = note if note != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "file": file,
          "revision": revision,
          "id": id,
          "formattedName": formatted_name,
          "name": name,
          "nickname": nickname,
          "birthday": birthday,
          "addresses": addresses,
          "url": url,
          "phones": phones,
          "emails": emails,
          "timezone": timezone,
          "geo": geo,
          "title": title,
          "role": role,
          "organization": organization,
          "categories": categories,
          "note": note
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VCardData
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::VCardData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["file"].nil?
          file = nil
        else
          file = parsed_json["file"].to_json
          file = Pinnacle::Types::VCardDataFile.from_json(json_object: file)
        end
        revision = parsed_json["revision"]
        id = parsed_json["id"]
        formatted_name = parsed_json["formattedName"]
        if parsed_json["name"].nil?
          name = nil
        else
          name = parsed_json["name"].to_json
          name = Pinnacle::Types::VCardName.from_json(json_object: name)
        end
        nickname = parsed_json["nickname"]
        birthday = parsed_json["birthday"]
        addresses = parsed_json["addresses"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::VcardAddress.from_json(json_object: item)
        end
        url = parsed_json["url"]
        phones = parsed_json["phones"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::VcardPhone.from_json(json_object: item)
        end
        emails = parsed_json["emails"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::VcardEmail.from_json(json_object: item)
        end
        timezone = parsed_json["timezone"]
        if parsed_json["geo"].nil?
          geo = nil
        else
          geo = parsed_json["geo"].to_json
          geo = Pinnacle::Types::VCardGeo.from_json(json_object: geo)
        end
        title = parsed_json["title"]
        role = parsed_json["role"]
        if parsed_json["organization"].nil?
          organization = nil
        else
          organization = parsed_json["organization"].to_json
          organization = Pinnacle::Types::VCardOrganization.from_json(json_object: organization)
        end
        categories = parsed_json["categories"]
        note = parsed_json["note"]
        new(
          file: file,
          revision: revision,
          id: id,
          formatted_name: formatted_name,
          name: name,
          nickname: nickname,
          birthday: birthday,
          addresses: addresses,
          url: url,
          phones: phones,
          emails: emails,
          timezone: timezone,
          geo: geo,
          title: title,
          role: role,
          organization: organization,
          categories: categories,
          note: note,
          additional_properties: struct
        )
      end

      # Serialize an instance of VCardData to a JSON object
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
        Pinnacle::Types::VCardDataFile.validate_raw(obj: obj.file)
        obj.revision&.is_a?(String) != false || raise("Passed value for field obj.revision is not the expected type, validation failed.")
        obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.formatted_name&.is_a?(String) != false || raise("Passed value for field obj.formatted_name is not the expected type, validation failed.")
        obj.name.nil? || Pinnacle::Types::VCardName.validate_raw(obj: obj.name)
        obj.nickname&.is_a?(Array) != false || raise("Passed value for field obj.nickname is not the expected type, validation failed.")
        obj.birthday&.is_a?(String) != false || raise("Passed value for field obj.birthday is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.phones&.is_a?(Array) != false || raise("Passed value for field obj.phones is not the expected type, validation failed.")
        obj.emails&.is_a?(Array) != false || raise("Passed value for field obj.emails is not the expected type, validation failed.")
        obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
        obj.geo.nil? || Pinnacle::Types::VCardGeo.validate_raw(obj: obj.geo)
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.role&.is_a?(String) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
        obj.organization.nil? || Pinnacle::Types::VCardOrganization.validate_raw(obj: obj.organization)
        obj.categories&.is_a?(Array) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
        obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      end
    end
  end
end
