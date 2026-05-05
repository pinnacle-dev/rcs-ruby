# frozen_string_literal: true

module Pinnacle
  module Forms
    module Submissions
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Paginated list of completed submissions for a form, newest first. Each row includes the submitted `data` keyed
        # by field `key`, the sender/recipient, IP, user-agent, and timestamps.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Forms::Submissions::Types::ListFormSubmissionsParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Pinnacle::Types::ListFormSubmissionsResponse]
        def list(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request_data = Pinnacle::Forms::Submissions::Types::ListFormSubmissionsParams.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "forms/#{URI.encode_uri_component(params[:id].to_s)}/submissions/list",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ListFormSubmissionsResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
