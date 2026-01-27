# frozen_string_literal: true

module Rcs
  class PinnacleBaseClient
    # @param base_url [String, nil]
    # @param api_key [String]
    #
    # @return [void]
    def initialize(api_key:, base_url: nil)
      @raw_client = Rcs::Internal::Http::RawClient.new(
        base_url: base_url || Rcs::Environment::DEFAULT,
        headers: {
          "User-Agent" => "rcs/2.0.8",
          "X-Fern-Language" => "Ruby",
          "PINNACLE-API-KEY" => api_key.to_s
        }
      )
    end

    # @return [Rcs::Brands::Client]
    def brands
      @brands ||= Rcs::Brands::Client.new(client: @raw_client)
    end

    # @return [Rcs::Audiences::Client]
    def audiences
      @audiences ||= Rcs::Audiences::Client.new(client: @raw_client)
    end

    # @return [Rcs::Contacts::Client]
    def contacts
      @contacts ||= Rcs::Contacts::Client.new(client: @raw_client)
    end

    # @return [Rcs::Conversations::Client]
    def conversations
      @conversations ||= Rcs::Conversations::Client.new(client: @raw_client)
    end

    # @return [Rcs::Messages::Client]
    def messages
      @messages ||= Rcs::Messages::Client.new(client: @raw_client)
    end

    # @return [Rcs::PhoneNumbers::Client]
    def phone_numbers
      @phone_numbers ||= Rcs::PhoneNumbers::Client.new(client: @raw_client)
    end

    # @return [Rcs::Rcs::Client]
    def rcs
      @rcs ||= Rcs::Rcs::Client.new(client: @raw_client)
    end

    # @return [Rcs::Webhooks::Client]
    def webhooks
      @webhooks ||= Rcs::Webhooks::Client.new(client: @raw_client)
    end

    # @return [Rcs::Campaigns::Client]
    def campaigns
      @campaigns ||= Rcs::Campaigns::Client.new(client: @raw_client)
    end

    # @return [Rcs::Status::Client]
    def status
      @status ||= Rcs::Status::Client.new(client: @raw_client)
    end

    # @return [Rcs::Tools::Client]
    def tools
      @tools ||= Rcs::Tools::Client.new(client: @raw_client)
    end
  end
end
