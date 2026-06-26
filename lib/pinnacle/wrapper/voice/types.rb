# frozen_string_literal: true

module Pinnacle
  module Wrapper
    module Voice
      module Types
        VOICE_COMMAND_ACTIONS = [
          CALL_ANSWER = "call.answer",
          CALL_END = "call.end",
          CALL_TRANSFER = "call.transfer",
          RECORDING_START = "recording.start",
          RECORDING_STOP = "recording.stop",
          AUDIO_PLAY = "audio.play",
          AUDIO_STOP = "audio.stop",
          AUDIO_REDUCE_NOISE = "audio.reduce_noise",
          INPUT_GET = "input.get",
          INPUT_CANCEL = "input.cancel",
          DTMF_SEND = "dtmf.send",
          CALL_UPDATE_STATE = "call.update_state"
        ].freeze

        USER_BUSY = "user_busy"
        CALL_REJECTED = "call_rejected"

        NOISE_DEFAULT = "default"
        NOISE_KRISP = "krisp"
        NOISE_AICOUSTICS = "aicoustics"

        DIRECTION_INBOUND = "inbound"
        DIRECTION_OUTBOUND = "outbound"
        DIRECTION_BOTH = "both"

        TRACK_INBOUND = "inbound"
        TRACK_OUTBOUND = "outbound"
      end
    end
  end
end
