# frozen_string_literal: true

module Pinnacle
  module Keywords
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # List campaign defaults and sender overrides for the authenticated team.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Pinnacle::Keywords::Types::KeywordsListRequestCampaignType, nil] :campaign_type
      # @option params [String, nil] :campaign_id
      # @option params [String, nil] :sender
      # @option params [String, nil] :recipient
      # @option params [Integer, nil] :page_index
      # @option params [Integer, nil] :page_size
      #
      # @return [Pinnacle::Types::KeywordConfigurationList]
      def list(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["campaignType"] = params[:campaign_type] if params.key?(:campaign_type)
        query_params["campaignId"] = params[:campaign_id] if params.key?(:campaign_id)
        query_params["sender"] = params[:sender] if params.key?(:sender)
        query_params["recipient"] = params[:recipient] if params.key?(:recipient)
        query_params["pageIndex"] = params[:page_index] if params.key?(:page_index)
        query_params["pageSize"] = params[:page_size] if params.key?(:page_size)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "keywords",
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
          Pinnacle::Types::KeywordConfigurationList.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create campaign defaults or a sender override. All three categories are required. Opt-in keywords are user-defined;
      # no opt-in keywords are added automatically. Reserved opt-out and help keywords remain recognized. Carrier-managed replies may take precedence over the configured response.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Keywords::Types::CreateKeywordConfiguration]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::KeywordConfiguration]
      def create(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "keywords",
          body: Pinnacle::Keywords::Types::CreateKeywordConfiguration.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::KeywordConfiguration.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get Keyword Configuration
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
      # @return [Pinnacle::Types::KeywordConfiguration]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "keywords/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::KeywordConfiguration.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Replace all category keyword lists and responses. The campaign and optional sender scope are immutable.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Keywords::Types::UpdateKeywordConfiguration]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Pinnacle::Types::KeywordConfiguration]
      def update(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request_data = Pinnacle::Keywords::Types::UpdateKeywordConfiguration.new(params).to_h
        non_body_param_names = %w[id]
        body = request_data.except(*non_body_param_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "keywords/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Pinnacle::Types::KeywordConfiguration.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete an override and restore inheritance. Existing consent status and history are retained.
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
      # @return [Pinnacle::Types::DeleteKeywordConfigurationResponse]
      def delete(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "keywords/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::DeleteKeywordConfigurationResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List current campaign-level opt-in/out status, optionally filtered by recipient. No record means no recorded
      # keyword consent; it does not establish permission to message.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Pinnacle::Keywords::Types::KeywordsListSubscriptionsRequestCampaignType, nil] :campaign_type
      # @option params [String, nil] :campaign_id
      # @option params [String, nil] :recipient
      # @option params [Integer, nil] :page_index
      # @option params [Integer, nil] :page_size
      #
      # @return [Pinnacle::Types::MessagingSubscriptionList]
      def list_subscriptions(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["campaignType"] = params[:campaign_type] if params.key?(:campaign_type)
        query_params["campaignId"] = params[:campaign_id] if params.key?(:campaign_id)
        query_params["recipient"] = params[:recipient] if params.key?(:recipient)
        query_params["pageIndex"] = params[:page_index] if params.key?(:page_index)
        query_params["pageSize"] = params[:page_size] if params.key?(:page_size)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "keywords/subscriptions",
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
          Pinnacle::Types::MessagingSubscriptionList.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # List immutable matched MO events and response ownership, including opt-out and subsequent opt-in timestamps.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Pinnacle::Keywords::Types::KeywordsListEventsRequestCampaignType, nil] :campaign_type
      # @option params [String, nil] :campaign_id
      # @option params [String, nil] :sender
      # @option params [String, nil] :recipient
      # @option params [Integer, nil] :page_index
      # @option params [Integer, nil] :page_size
      #
      # @return [Pinnacle::Types::KeywordEventList]
      def list_events(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["campaignType"] = params[:campaign_type] if params.key?(:campaign_type)
        query_params["campaignId"] = params[:campaign_id] if params.key?(:campaign_id)
        query_params["sender"] = params[:sender] if params.key?(:sender)
        query_params["recipient"] = params[:recipient] if params.key?(:recipient)
        query_params["pageIndex"] = params[:page_index] if params.key?(:page_index)
        query_params["pageSize"] = params[:page_size] if params.key?(:page_size)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "keywords/events",
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
          Pinnacle::Types::KeywordEventList.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Resolve sender override, campaign default, then registration defaults. Consent remains campaign-scoped.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :sender
      #
      # @return [Pinnacle::Types::EffectiveKeywordConfiguration]
      def get_effective(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["sender"] = params[:sender] if params.key?(:sender)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "keywords/effective",
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
          Pinnacle::Types::EffectiveKeywordConfiguration.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
