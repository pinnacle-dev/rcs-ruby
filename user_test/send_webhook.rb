#!/usr/bin/env ruby
# frozen_string_literal: true

=begin
Send a test webhook request to the running webhook server.
This simulates what Pinnacle would send to your webhook endpoint.

Usage:
    1. First start the server: bundle exec ruby test.rb server
    2. In another terminal: bundle exec ruby send_webhook.rb
=end

require 'net/http'
require 'json'
require 'uri'

def send_webhook
  """Send a test webhook request to the local server"""

  # Use a test secret for webhook testing
  webhook_secret = 'test-webhook-secret'

  # Create webhook payload matching MessageEvent structure
  webhook_data = {
    type: 'MESSAGE.RECEIVED',
    conversation: {
      id: 123,
      from: '+14155551234',
      to: '+14155555678'
    },
    status: 'RECEIVED',     # Must match MessageStatusEnum
    direction: 'INBOUND',   # Must match MessageEventDirection
    segments: 1,
    sentAt: '2024-01-01T00:00:00Z',
    message: {
      id: 456,  # Integer, not String
      content: {
        text: 'Test message from webhook simulator'
      }
    }
  }

  # Send the request
  url = URI('http://localhost:8080/webhook')

  begin
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url.path)
    request['Content-Type'] = 'application/json'
    request['PINNACLE-SIGNING-SECRET'] = webhook_secret
    request.body = webhook_data.to_json

    response = http.request(request)

    if response.code == '200'
      puts "✅ Webhook processed successfully!"
      puts "   Response: #{response.body}"
    else
      puts "❌ Webhook failed with status #{response.code}"
      puts "   Response: #{response.body}"
    end
  rescue Errno::ECONNREFUSED
    puts "❌ Could not connect to server at #{url}"
    puts "   Make sure the server is running: ruby test.rb server"
  rescue => e
    puts "❌ Error: #{e.message}"
  end
end

if __FILE__ == $0
  send_webhook
end