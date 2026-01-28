# frozen_string_literal: true

module Rcs
  module Wrapper
    module Tools
      class Client < Rcs::Tools::Client
        # @return [Rcs::Wrapper::Tools::FileUploader]
        def file
          @file ||= Rcs::Wrapper::Tools::FileUploader.new(client: @client)
        end
      end
    end
  end
end
