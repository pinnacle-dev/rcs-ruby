# frozen_string_literal: true

module Pinnacle
  module Types
    # SMS/MMS fallback message to send if the RCS message fails to deliver.
    #
    # When a recipient's device doesn't support RCS, this fallback message will be sent as SMS or MMS instead. The
    # fallback is sent from the specified phone number.
    #
    # > **Note:** At least one of `text` or `mediaUrls` must be provided. Fallback messages require a verified `from`
    # phone number with SMS/MMS sending capabilities.
    #
    # > **Billing:** You will be charged the standard SMS or MMS rate for the fallback message. The original RCS message
    # will not be charged if the fallback is sent instead.
    class FallbackMessage < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: true, nullable: false
      field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"
    end
  end
end
