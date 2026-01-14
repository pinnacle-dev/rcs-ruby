# frozen_string_literal: true

module Pinnacle
  class Client
    # @param base_url [String, nil]
    # @param api_key [String]
    #
    # @return [void]
    def initialize(api_key:, base_url: nil)
      @raw_client = Pinnacle::Internal::Http::RawClient.new(
        base_url: base_url || Pinnacle::Environment::DEFAULT,
        headers: {
          "User-Agent" => "rcs/2.0.6-rc.1",
          "X-Fern-Language" => "Ruby",
          "PINNACLE-API-KEY" => api_key.to_s
        }
      )
    end

    # @return [Pinnacle::Brands::Client]
    def brands
      @brands ||= Pinnacle::Brands::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Audiences::Client]
    def audiences
      @audiences ||= Pinnacle::Audiences::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Contacts::Client]
    def contacts
      @contacts ||= Pinnacle::Contacts::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Conversations::Client]
    def conversations
      @conversations ||= Pinnacle::Conversations::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Messages::Client]
    def messages
      @messages ||= Pinnacle::Messages::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::PhoneNumbers::Client]
    def phone_numbers
      @phone_numbers ||= Pinnacle::PhoneNumbers::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Rcs::Client]
    def rcs
      @rcs ||= Pinnacle::Rcs::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Webhooks::Client]
    def webhooks
      @webhooks ||= Pinnacle::Webhooks::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Campaigns::Client]
    def campaigns
      @campaigns ||= Pinnacle::Campaigns::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Status::Client]
    def status
      @status ||= Pinnacle::Status::Client.new(client: @raw_client)
    end

    # @return [Pinnacle::Tools::Client]
    def tools
      @tools ||= Pinnacle::Tools::Client.new(client: @raw_client)
    end
  end
end
