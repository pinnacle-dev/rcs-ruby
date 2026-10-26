# frozen_string_literal: true

module Pinnacle
  module Conferences
    module Participants
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Everyone who has been in the conference, including people who left or never connected.
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
        # @return [Pinnacle::Types::ListParticipantsResponse]
        def list(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "conferences/#{URI.encode_uri_component(params[:id].to_s)}/participants",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ListParticipantsResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Add someone: dial a new number (`to` + `from`) or pull in a call you already have (`call_id`).
        #
        # A dialed participant is returned with status `dialing` and joins when they answer; you'll get
        # `participant.joined` (or `participant.failed` if they don't answer). With `announce`, they hear it alone
        # before joining.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Types::AddConferenceParticipantParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String, nil] :idempotency_key
        #
        # @return [Pinnacle::Types::ConferenceParticipant]
        def add(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "conferences/#{URI.encode_uri_component(params[:id].to_s)}/participants",
            headers: headers,
            body: Pinnacle::Types::AddConferenceParticipantParams.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ConferenceParticipant.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :participant
        #
        # @return [Pinnacle::Types::ConferenceParticipant]
        def get(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "conferences/#{URI.encode_uri_component(params[:id].to_s)}/participants/#{URI.encode_uri_component(params[:participant].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ConferenceParticipant.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Hang up this participant's call. Everyone else stays in the conference.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :participant
        #
        # @return [Pinnacle::Types::ConferenceParticipant]
        def remove(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "conferences/#{URI.encode_uri_component(params[:id].to_s)}/participants/#{URI.encode_uri_component(params[:participant].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ConferenceParticipant.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Mute, hold, or whisper. Only the fields you send change, and only real changes are applied.
        #
        # - `muted: true`: nobody hears them; they still hear everyone.
        # - `on_hold: true`: they hear hold audio; nobody hears them.
        # - `whisper_to: ["specialist"]`: only the specialist hears them. `null` goes back to everyone.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Conferences::Participants::Types::UpdateConferenceParticipantParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :participant
        #
        # @return [Pinnacle::Types::ConferenceParticipant]
        def update(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request_data = Pinnacle::Conferences::Participants::Types::UpdateConferenceParticipantParams.new(params).to_h
          non_body_param_names = %w[id participant]
          body = request_data.except(*non_body_param_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "conferences/#{URI.encode_uri_component(params[:id].to_s)}/participants/#{URI.encode_uri_component(params[:participant].to_s)}",
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
            Pinnacle::Types::ConferenceParticipant.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
