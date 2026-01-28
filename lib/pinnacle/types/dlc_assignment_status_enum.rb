# frozen_string_literal: true

module Pinnacle
  module Types
    module DlcAssignmentStatusEnum
      extend Pinnacle::Internal::Types::Enum

      ASSIGNED = "ASSIGNED"
      FAILED_ASSIGNMENT = "FAILED_ASSIGNMENT"
      FAILED_UNASSIGNMENT = "FAILED_UNASSIGNMENT"
      PENDING_ASSIGNMENT = "PENDING_ASSIGNMENT"
      PENDING_UNASSIGNMENT = "PENDING_UNASSIGNMENT"
    end
  end
end
