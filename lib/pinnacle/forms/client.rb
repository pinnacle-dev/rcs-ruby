# frozen_string_literal: true

module Pinnacle
  module Forms
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve a form by id. Includes submission count, last submission timestamp, and archive state.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Pinnacle::Types::Form]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "forms/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::Form.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Partial update. Only keys present in the body are applied. Archived forms (non-null `archived_at`) cannot be
      # updated — restore the form by setting `archived_at: null` in a PATCH first.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Forms::Types::UpdateFormParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Pinnacle::Types::Form]
      def update(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request_data = Pinnacle::Forms::Types::UpdateFormParams.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "forms/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Pinnacle::Types::Form.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Paginated list of forms on your team, sorted by creation date (newest first). Includes archived forms.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Forms::Types::ListFormsParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::ListFormsResponse]
      def list(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "forms/list",
          body: Pinnacle::Forms::Types::ListFormsParams.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::ListFormsResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create a hosted form without sending it. <br>
      #
      # Returns the form object including its public URL — `https://forms.pinnacle.sh/{form_id}`. <br>
      #
      # To also deliver the URL to a recipient over SMS or RCS in a single call, use [`POST
      # /forms/send`](/api-reference/forms/send-form).
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Types::CreateFormRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::Form]
      def create(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "forms",
          body: params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::Form.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Send a form to a recipient over SMS or RCS, or mint a standalone submission URL.
      #
      # Pass `form` as either an existing form id (`form_*`) or an inline `{ fields, ... }` definition to mint a new
      # form for this send.
      #
      # The delivery channel is inferred from `from`:
      # - `from: "agent_*"` → RCS (with optional SMS `fallback`)
      # - `from: "+E.164"` → SMS
      #
      # When `to` is provided, Pinnacle dispatches a message whose body contains the submission URL and the recipient is
      # recorded on the response: `submission.to` echoes the same E.164 number and `message_id` is the id of the
      # outbound SMS/RCS.
      #
      # When `to` is omitted, no message is sent — `submission.to` and `message_id` are both `null` — which is useful
      # for embedding the URL in your own outreach.
      #
      # On completion, a `FORM.SUBMISSION` webhook event is delivered to webhooks subscribed to the sender. See
      # [Receiving Messages and User Events](/guides/messages/receiving).
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Types::SendFormParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Forms::Types::FormsSendResponse]
      def send_(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "forms/send",
          body: Pinnacle::Types::SendFormParams.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Forms::Types::FormsSendResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Pinnacle::Submissions::Client]
      def submissions
        @submissions ||= Pinnacle::Forms::Submissions::Client.new(client: @client)
      end
    end
  end
end
