# frozen_string_literal: true

module Pinnacle
  module Types
    # Message containing cards, each with its own title, subtitle, and/or buttons. Quick replies can also be added. <br>
    #
    # See (supported file types)[https://app.pinnacle.sh/supported-file-types?type=RCS-CARD].
    class RcsCardsContent < Internal::Types::Model
      field :cards, -> { Internal::Types::Array[Pinnacle::Types::RcsCardsContentCardsItem] }, optional: false, nullable: false
      field :quick_replies, -> { Internal::Types::Array[Pinnacle::Types::RichButton] }, optional: false, nullable: false, api_name: "quickReplies"
    end
  end
end
