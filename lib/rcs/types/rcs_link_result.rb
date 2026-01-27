# frozen_string_literal: true

module Rcs
  module Types
    # Response containing the generated RCS service id and/or url. You can always create a link with the service id that
    # is returned.
    # To create a link follow the format: sms://{PHONE_NUMBER}?service_id={SERVICE_ID}&body={URL_ENCODED_BODY}
    class RcsLinkResult < Internal::Types::Model
      field :url, -> { String }, optional: true, nullable: false
      field :service_id, -> { String }, optional: false, nullable: false, api_name: "serviceId"
    end
  end
end
