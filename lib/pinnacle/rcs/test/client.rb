# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Test
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Create a new RCS test agent for development and testing.
        #
        # ## Overview
        #
        # Test agents let you build and test full RCS functionality — rich cards, carousels, buttons,
        # quick replies, and media messages — without going through the full carrier review process.
        # Messages from test agents can only be sent to [whitelisted phone
        # numbers](/api-reference/rcs-agents/test/whitelist-number).
        #
        # ## Limits
        #
        # - **Maximum 5 test agents per account.**
        #
        # ## Image Requirements
        #
        # | Image | Format | Max Size |
        # |-------|--------|----------|
        # | Logo  | JPEG, PNG | 50 KB |
        # | Hero  | JPEG, PNG | 200 KB |
        #
        # ## After Creation
        #
        # Once your test agent is created, you'll need to:
        #
        # 1. **Whitelist test phone numbers** using [`POST
        # /rcs/test/agents/{agentId}/whitelist`](/api-reference/rcs-agents/test/whitelist-number).
        # 2. **Accept the tester invite** on each whitelisted device.
        # 3. **Send messages** using [`POST /messages/send/rcs`](/api-reference/messages/send-rcs) with the returned
        # agent ID as the `from` field.
        #
        # > **2-Minute Cooldown**
        # >
        # > After creating a test agent, there is a mandatory 2-minute cooldown before you can whitelist phone numbers.
        # > This is a requirement imposed by Google's RBM platform.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Rcs::Test::Types::CreateTestAgentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::TestAgentResponse]
        def create_agent(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "rcs/test/agents",
            body: Pinnacle::Rcs::Test::Types::CreateTestAgentRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::TestAgentResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update an existing RCS test agent's configuration.
        #
        # All fields are optional — only include the fields you want to update.
        #
        # ## Image Requirements
        #
        # If updating images, the same requirements apply as when creating an agent:
        #
        # | Image | Format | Max Size |
        # |-------|--------|----------|
        # | Logo  | JPEG, PNG | 50 KB |
        # | Hero  | JPEG, PNG | 200 KB |
        #
        # > **2-Minute Cooldown**
        # >
        # > After updating a test agent, there is a mandatory 2-minute cooldown before you can whitelist phone numbers.
        # > This is a requirement imposed by Google's RBM platform.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Rcs::Test::Types::UpdateTestAgentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :agent_id
        #
        # @return [Pinnacle::Types::TestAgentResponse]
        def update_agent(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request_data = Pinnacle::Rcs::Test::Types::UpdateTestAgentRequest.new(params).to_h
          non_body_param_names = ["agentId"]
          body = request_data.except(*non_body_param_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PATCH",
            path: "rcs/test/agents/#{params[:agent_id]}",
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
            Pinnacle::Types::TestAgentResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Whitelist a phone number for testing with a specific test agent.
        #
        # During development and testing, RCS agents can only send messages to whitelisted phone numbers.
        # Use this endpoint to whitelist specific phone numbers so you can send and receive messages from the test
        # agent.
        #
        # ## Verification Process
        #
        # After whitelisting, the recipient must accept the tester invite:
        #
        # 1. The recipient's device will receive a message from "RBM Tester Management".
        # 2. The recipient must tap "Make me a tester" to accept.
        # 3. Once accepted, the status transitions from `PENDING` to `ACCEPTED`.
        #
        # ## Verification
        #
        # <div style="display: flex; gap: 16px;">
        #   <div style="flex: 1; text-align: center;">
        #     <strong>Accepting the invite</strong><br/>
        # <img src="https://pncl.to/f769cAvCbEx-MmezZjR6dz6KVkr5ZO" alt="Accepting the tester invite" style="max-width:
        # 100%;" />
        #   </div>
        #   <div style="flex: 1; text-align: center;">
        #     <strong>Declining the invite</strong><br/>
        # <img src="https://pncl.to/VRere3tEKfx4n0HNaxK-vwl7pbLHTJ" alt="Declining the tester invite" style="max-width:
        # 100%;" />
        #   </div>
        # </div>
        #
        # ## Cooldown
        #
        # There is a **2-minute cooldown** after creating or updating a test agent before you can whitelist numbers.
        # Attempting to whitelist during the cooldown returns a `500` error with the remaining wait time.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Rcs::Test::Types::TestAgentWhitelistRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :agent_id
        #
        # @return [Pinnacle::Types::TestAgentWhitelistResponse]
        def whitelist_number(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request_data = Pinnacle::Rcs::Test::Types::TestAgentWhitelistRequest.new(params).to_h
          non_body_param_names = ["agentId"]
          body = request_data.except(*non_body_param_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "rcs/test/agents/#{params[:agent_id]}/whitelist",
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
            Pinnacle::Types::TestAgentWhitelistResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Check the current whitelist status of a phone number for a specific test agent.
        #
        # Use this endpoint to poll the status of a previously whitelisted number and determine
        # whether the recipient has accepted or rejected the tester invite.
        #
        # ## Status Values
        #
        # - **`PENDING`** — The tester invite was sent but the recipient has not yet responded. Ask the recipient to
        # check their messages and accept the invite.
        # - **`ACCEPTED`** — The recipient accepted the invite. Messages can be exchanged.
        # - **`REJECTED`** — The recipient rejected the invite or the invite could not be delivered since the carrier
        # does not support test agents. If the user rejected the invite, they can accept it again by tapping "Make me a
        # tester" in the same message from "RBM Tester Management".
        #
        # <div style="display: flex; gap: 16px;">
        #   <div style="flex: 1; text-align: center;">
        #     <strong>Accepting the invite</strong><br/>
        # <img src="https://pncl.to/f769cAvCbEx-MmezZjR6dz6KVkr5ZO" alt="Accepting the tester invite" style="max-width:
        # 100%;" />
        #   </div>
        #   <div style="flex: 1; text-align: center;">
        #     <strong>Declining the invite</strong><br/>
        # <img src="https://pncl.to/VRere3tEKfx4n0HNaxK-vwl7pbLHTJ" alt="Declining the tester invite" style="max-width:
        # 100%;" />
        #   </div>
        # </div>
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :agent_id
        # @option params [String] :phone_number
        #
        # @return [Pinnacle::Types::TestAgentWhitelistResponse]
        def get_whitelist_status(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[phone_number]
          query_params = {}
          query_params["phoneNumber"] = params[:phone_number] if params.key?(:phone_number)
          params = params.except(*query_param_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "rcs/test/agents/#{params[:agent_id]}/numbers",
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
            Pinnacle::Types::TestAgentWhitelistResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
