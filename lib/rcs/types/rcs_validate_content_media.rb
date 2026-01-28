# frozen_string_literal: true

module Rcs
  module Types
    # Message containing a media file and/or text with optional quick reply buttons.<br>
    #
    # See [supported media types](https://app.pinnacle.sh/supported-file-types?type=RCS-MEDIA).
    class RcsValidateContentMedia < Internal::Types::Model
      field :media, -> { String }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
    end
  end
end
