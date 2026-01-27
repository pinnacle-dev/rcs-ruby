# frozen_string_literal: true

module Rcs
  module Messages
    module Blast
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Send an SMS message to all contacts in an audience. <br>
        #
        # Messages are distributed evenly across the provided sender phone numbers. <br>
        #
        # Use the optional `schedule` parameter in `options` to schedule the blast for future delivery. When scheduled,
        # the response will contain a `scheduleId` instead of blast details.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Messages::Blast::Types::BlastSms]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Messages::Blast::Types::BlastSmsResponse]
        def sms(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[audience_id senders message options]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/blast/sms",
            body: Rcs::Messages::Blast::Types::BlastSms.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Messages::Blast::Types::BlastSmsResponse.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Send an MMS message to all contacts in an audience. <br>
        #
        # Messages are distributed evenly across the provided sender phone numbers. <br>
        #
        # Use the optional `schedule` parameter in `options` to schedule the blast for future delivery. When scheduled,
        # the response will contain a `scheduleId` instead of blast details.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Messages::Blast::Types::BlastMms]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Messages::Blast::Types::BlastMmsResponse]
        def mms(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[audience_id senders message options]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/blast/mms",
            body: Rcs::Messages::Blast::Types::BlastMms.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Messages::Blast::Types::BlastMmsResponse.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Send an RCS message to all contacts in an audience. <br>
        #
        # Messages are distributed evenly across the provided RCS agents for load balancing. Requires active RCS agents
        # and recipient devices that support RCS Business Messaging. <br>
        #
        # Use the optional `schedule` parameter in `options` to schedule the blast for future delivery. When scheduled,
        # the response will contain a `scheduleId` instead of blast details.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Messages::Blast::Types::BlastRcs]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Messages::Blast::Types::BlastRcsResponse]
        def rcs(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[audience_id senders message options]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/blast/rcs",
            body: Rcs::Messages::Blast::Types::BlastRcs.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Messages::Blast::Types::BlastRcsResponse.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
