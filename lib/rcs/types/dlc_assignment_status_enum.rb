# frozen_string_literal: true

module Pinnacle
  # Current assignment status of the phone number to this campaign.
  #  `ASSIGNED`: Number assigned and ready to send messages.
  #  `PENDING_ASSIGNMENT`: In the process of being assigned.
  #  `PENDING_UNASSIGNMENT`: In the process of being unassigned.
  #  `FAILED_ASSIGNMENT`: Failed to assign the number.
  #  `FAILED_UNASSIGNMENT`: Failed to unassign the number.
  class DlcAssignmentStatusEnum
    ASSIGNED = "ASSIGNED"
    FAILED_ASSIGNMENT = "FAILED_ASSIGNMENT"
    FAILED_UNASSIGNMENT = "FAILED_UNASSIGNMENT"
    PENDING_ASSIGNMENT = "PENDING_ASSIGNMENT"
    PENDING_UNASSIGNMENT = "PENDING_UNASSIGNMENT"
  end
end
