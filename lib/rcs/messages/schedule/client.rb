# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/schedule_cancel_result"
require "async"

module Pinnacle
  module Messages
    class ScheduleClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Messages::ScheduleClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Cancel a scheduled message or blast. <br>
      #  Works for both individual scheduled messages and scheduled blasts. Use the
      #  `scheduleId` returned when the message or blast was scheduled.
      #
      # @param id [String] Unique identifier of the scheduled message. This identifier is a string that
      #  always begins with the prefix `msg_sched_`, for example: `msg_sched_1234567890`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ScheduleCancelResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.schedule.cancel(id: "id")
      def cancel(id:, request_options: nil)
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/schedule/#{id}"
        end
        Pinnacle::Types::ScheduleCancelResult.from_json(json_object: response.body)
      end
    end

    class AsyncScheduleClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Messages::AsyncScheduleClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Cancel a scheduled message or blast. <br>
      #  Works for both individual scheduled messages and scheduled blasts. Use the
      #  `scheduleId` returned when the message or blast was scheduled.
      #
      # @param id [String] Unique identifier of the scheduled message. This identifier is a string that
      #  always begins with the prefix `msg_sched_`, for example: `msg_sched_1234567890`.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::ScheduleCancelResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.schedule.cancel(id: "id")
      def cancel(id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/schedule/#{id}"
          end
          Pinnacle::Types::ScheduleCancelResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
