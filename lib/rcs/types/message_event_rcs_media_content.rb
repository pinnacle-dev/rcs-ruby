# frozen_string_literal: true

module Rcs
  module Types
    # RCS message containing a media file with optional quick reply buttons. <br>
    #
    # See [supported file types](https://app.pinnacle.sh/supported-file-types?type=RCS-MEDIA).
    class MessageEventRcsMediaContent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :media, -> { String }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
    end
  end
end
