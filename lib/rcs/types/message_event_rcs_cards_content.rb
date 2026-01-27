# frozen_string_literal: true

module Rcs
  module Types
    # RCS message containing cards, each with its own title, subtitle, and/or buttons. Quick replies can also be added.
    # <br>
    #
    # See [supported file types](https://app.pinnacle.sh/supported-file-types?type=RCS-CARD).
    class MessageEventRcsCardsContent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :cards, -> { Internal::Types::Array[Rcs::Types::MessageEventRcsCardsContentCardsItem] }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Rcs::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
    end
  end
end
