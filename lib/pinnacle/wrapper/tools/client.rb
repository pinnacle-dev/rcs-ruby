# frozen_string_literal: true

module Pinnacle
  module Wrapper
    module Tools
      class Client < Pinnacle::Tools::Client
        # @return [Pinnacle::Wrapper::Tools::FileUploader]
        def file
          @file ||= Pinnacle::Wrapper::Tools::FileUploader.new(client: @client)
        end
      end
    end
  end
end
