# frozen_string_literal: true

module Pinnacle
  module Faxes
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List your team's fax history, newest first.
      #
      # **HIPAA only:** this endpoint exists only in Pinnacle's HIPAA cell and is unavailable at
      # `https://api.pinnacle.sh`.
      #
      # Results contain complete faxes only. Use `nextOffset` until it is null. The maximum page size is 100 records and
      # the maximum offset is 100,000.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      # @option params [Pinnacle::Types::FaxDirectionEnum, nil] :direction
      #
      # @return [Pinnacle::Types::ListFaxesResponse]
      def list(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["direction"] = params[:direction] if params.key?(:direction)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "fax",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::ListFaxesResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Send one PDF, TIFF, JPEG, PNG, DOC, DOCX, RTF, or TXT document from a configured fax number.
      #
      # **HIPAA only:** this endpoint exists only in Pinnacle's HIPAA cell. Complete HIPAA onboarding and use the
      # connection details provided by Pinnacle. It is not available at `https://api.pinnacle.sh`.
      #
      # **Availability:** `from` must be an enabled fax number owned by your team. Fax sending is unavailable for
      # development-mode teams and sandbox numbers. Each request accepts exactly one document; cover pages and
      # per-request webhook URLs are not supported.
      #
      # **Source URL:** `mediaUrl` must be a publicly reachable HTTPS URL on port 443. Signed query parameters are
      # supported. URLs with credentials, redirects, private or local network addresses, and non-200 responses are
      # rejected. Downloads must complete within 30 seconds.
      #
      # **Document limits:** the document must contain 1–3,500 pages and be no larger than 50 MB. Documents over 350
      # pages are split automatically and remain one fax in the API. File extensions and response headers do not
      # override file validation.
      #
      # **Document safety:** encrypted files, macros, ActiveX controls, embedded objects, symbolic links, unsafe archive
      # paths, and malformed documents are rejected.
      #
      # **Quality:** `HIGH` is the default and recommended choice for most documents. Use `NORMAL` when speed matters
      # more than detail, `VERY_HIGH` for small text and fine lines, `ULTRA_LIGHT` for image-heavy documents, or
      # `ULTRA_DARK` for text-heavy documents.
      #
      # **Asynchronous processing:** the request returns 202 after preparation is queued. Downloading, validation,
      # conversion, splitting, and archival happen afterward. A 202 response does not mean the document is valid or
      # delivered. Watch `FAX.STATUS` webhooks or retrieve the fax for the final result. The initial status is
      # `PREPARING`, `reservedCost` is zero, and `hasMedia` is false.
      #
      # **Multipart delivery:** the original `id` identifies the complete fax across list, detail, cancellation,
      # billing, media, and webhooks. Parts are sent in order. If a part fails, later parts are not sent. The fax
      # becomes `FAILED`, and `partialContent` is true if any earlier pages were transmitted.
      #
      # **Pricing:** sent and received faxes cost $0.025 per transmitted page. Quality does not change the rate.
      # Pinnacle reserves the estimated cost after preparation, charges only for transmitted pages, and returns unused
      # reserved credits. If your balance is too low, the fax becomes `FAILED` with `failureReason:
      # INSUFFICIENT_CREDITS`.
      #
      # **Delivery uncertainty:** Pinnacle does not automatically retry a fax after transmission may have started, which
      # prevents duplicate delivery and charges. If transmission cannot be confirmed, status becomes
      # `SUBMISSION_UNKNOWN` while Pinnacle reconciles the fax.
      #
      # **Idempotency:** `Idempotency-Key` is optional. Without it, each request creates a new fax, including retries.
      # For retry-safe sending, generate a UUID for each intended fax and retain it until the outcome is known. After a
      # client timeout, retry with the same key and identical body. The key is scoped to your team and covers `from`,
      # `to`, `mediaUrl`, and `quality`. Reusing it with an identical body returns the existing fax; changing any of
      # those fields returns 409.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Faxes::Types::SendFaxParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :idempotency_key
      #
      # @return [Pinnacle::Types::Fax]
      def send_(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request_data = Pinnacle::Faxes::Types::SendFaxParams.new(params).to_h
        non_body_param_names = %w[Idempotency-Key]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "fax",
          headers: headers,
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
          Pinnacle::Types::Fax.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve a fax and a one-hour signed document URL when its media is available.
      #
      # **HIPAA only:** this endpoint exists only in Pinnacle's HIPAA cell and is unavailable at
      # `https://api.pinnacle.sh`.
      #
      # Only faxes owned by your team are accessible. Unknown IDs and records removed by your team's HIPAA retention
      # policy return 404. `mediaUrl` is null until archival completes and expires one hour after retrieval; request the
      # fax again for a new URL.
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
      # @return [Pinnacle::Types::FaxDetail]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "fax/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::FaxDetail.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancel an outbound fax before transmission starts.
      #
      # Cancellation stops queued preparation and every unsent part, releases the credit reservation, and changes the
      # status to `CANCELLED`. Repeating a successful cancellation returns the same fax.
      #
      # Cancellation is unavailable for inbound faxes, completed faxes, and `SUBMISSION_UNKNOWN` faxes. Pinnacle returns
      # 409 once transmission may have started, even when later parts remain unsent.
      #
      # **HIPAA only:** this endpoint exists only in Pinnacle's HIPAA cell and is unavailable at
      # `https://api.pinnacle.sh`.
      #
      # Only a fax ID owned by your team is accepted. Unknown IDs return 404.
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
      # @return [Pinnacle::Types::Fax]
      def cancel(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "fax/#{URI.encode_uri_component(params[:id].to_s)}/cancel",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::Fax.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
