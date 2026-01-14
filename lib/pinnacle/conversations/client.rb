# frozen_string_literal: true

module Pinnacle
  module Conversations
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Fetch a specific conversation using either its unique identifier or by matching sender and recipient details.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Types::GetConversationParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::Conversation, nil]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "conversations/get",
          body: Pinnacle::Types::GetConversationParams.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Retrieves conversations by page with optional filtering based off provided parameters.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Conversations::Types::ListConversationsParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::ConversationList]
      def list(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[brand_id campaign_id campaign_type page_index page_size receiver sender]
        body_bag = params.slice(*body_prop_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "conversations/list",
          body: Pinnacle::Conversations::Types::ListConversationsParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::ConversationList.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update the notes associated with a specific conversation.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::Conversations::Types::UpdateConversationParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::Types::SuccessfulConversationUpdate]
      def update(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[id notes]
        body_bag = params.slice(*body_prop_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "conversations/update",
          body: Pinnacle::Conversations::Types::UpdateConversationParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::Types::SuccessfulConversationUpdate.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve a paginated and filtered list of messages for a specific conversation.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [Integer, nil] :page_index
      # @option params [Integer, nil] :page_size
      # @option params [Pinnacle::Conversations::Types::ConversationsListMessagesRequestSortOrder, nil] :sort_order
      # @option params [Pinnacle::Conversations::Types::ConversationsListMessagesRequestDirection, nil] :direction
      # @option params [Pinnacle::Conversations::Types::ConversationsListMessagesRequestStatus, nil] :status
      # @option params [Pinnacle::Conversations::Types::ConversationsListMessagesRequestType, nil] :type
      # @option params [String, nil] :date_from
      # @option params [String, nil] :date_to
      #
      # @return [Pinnacle::Types::MessageList]
      def list_messages(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[page_index page_size sort_order direction status type date_from date_to]
        query_params = {}
        query_params["pageIndex"] = params[:page_index] if params.key?(:page_index)
        query_params["pageSize"] = params[:page_size] if params.key?(:page_size)
        query_params["sortOrder"] = params[:sort_order] if params.key?(:sort_order)
        query_params["direction"] = params[:direction] if params.key?(:direction)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["type"] = params[:type] if params.key?(:type)
        query_params["dateFrom"] = params[:date_from] if params.key?(:date_from)
        query_params["dateTo"] = params[:date_to] if params.key?(:date_to)
        params = params.except(*query_param_names)

        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "conversations/#{params[:id]}/messages",
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
          Pinnacle::Types::MessageList.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
