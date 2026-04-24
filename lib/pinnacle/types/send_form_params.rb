# frozen_string_literal: true

module Pinnacle
  module Types
    # Send a form to a recipient over SMS or RCS in one call, or mint a standalone submission URL when `to` is omitted.
    # Picks the SMS or RCS branch based on the shape of `from` (agent_* → RCS, E.164 → SMS).
    #
    # When `to` is provided, Pinnacle dispatches the message immediately and the recipient is recorded on the response
    # (`submission.to` is set to the same E.164 number, and `message_id` is the id of the outbound SMS/RCS).
    #
    # When `to` is omitted, no message is sent — `submission.to` and `message_id` are both `null` and only the
    # submission URL is returned.
    class SendFormParams < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::SendFormViaRcsParams }
      member -> { Pinnacle::Types::SendFormViaSmsParams }
    end
  end
end
