#!/usr/bin/env ruby
# frozen_string_literal: true

=begin
Simple test file for RCS SDK from user's perspective.
Usage:
  bundle exec ruby test.rb path/to/file.jpg  # Test upload_from_path
  bundle exec ruby test.rb server            # Test process with mock server
=end

require 'bundler/setup'
require 'pathname'
require 'dotenv'

# Load .env from project root (parent directory)
Dotenv.load(File.expand_path('../.env', __dir__))

# Add the lib directory to the load path
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'rcs'

def test_process
  """Run a simple server to test webhook processing."""
  begin
    require 'sinatra'
    require 'json'
  rescue LoadError
    puts "❌ Sinatra is required. Install with: gem install sinatra"
    exit 1
  end

  # Initialize the SDK
  api_key = ENV['PINNACLE_API_KEY']
  client = Pinnacle::Client.new(api_key: api_key)

  # Configure Sinatra
  set :port, 8080
  set :bind, '0.0.0.0'
  set :logging, false

  post '/webhook' do
    begin
      message_event = client.messages.process(request)

      puts "\n✅ Processed webhook:"
      puts "   Type: #{message_event.type}"
      puts "   From: #{message_event.conversation.from}"
      puts "   To: #{message_event.conversation.to}"
      puts "   Message: #{message_event.message.content}" if message_event.message.content

      content_type :json
      { status: 'success' }.to_json
    rescue Faraday::UnauthorizedError => e
      puts "\n❌ Unauthorized: #{e.message}"
      status 401
      content_type :json
      { error: e.message }.to_json
    rescue => e
      puts "\n❌ Error: #{e.message}"
      status 400
      content_type :json
      { error: e.message }.to_json
    end
  end

  puts "🚀 Server running on http://localhost:8080/webhook"
  puts "   Press Ctrl+C to stop"
end

def test_upload_from_path(file_path, custom_name = nil)
  """Test uploading a file."""
  # Check API key
  api_key = ENV['PINNACLE_API_KEY']
  unless api_key
    puts "❌ PINNACLE_API_KEY environment variable is required"
    exit 1
  end

  # Initialize the SDK
  client = Pinnacle::Client.new(api_key: api_key)

  # Check file exists
  unless File.exist?(file_path)
    puts "❌ File not found: #{file_path}"
    exit 1
  end

  puts "📁 Uploading: #{file_path}"
  puts "   Custom name: #{custom_name}" if custom_name
  puts "   Size: #{File.size(file_path).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} bytes"

  begin
    download_url = client.tools.file.upload_from_path(
      file_path,
      name: custom_name
    )

    puts "✅ Upload successful!"
    puts "   Download URL: #{download_url}"
  rescue Faraday::ResourceNotFound => e
    puts "❌ File not found: #{e.message}"
    exit 1
  rescue Faraday::BadRequestError => e
    puts "❌ Bad request: #{e.message}"
    exit 1
  rescue Faraday::ServerError => e
    puts "❌ Upload failed: #{e.message}"
    exit 1
  rescue => e
    puts "❌ Upload failed: #{e.message}"
    exit 1
  end
end

if __FILE__ == $0
  if ARGV.length < 1
    puts __doc__
    puts "\nUsage:"
    puts "  ruby test.rb server                     # Run webhook server"
    puts "  ruby test.rb <file_path>                # Upload file"
    puts "  ruby test.rb <file_path> <custom_name>  # Upload with custom name"
    exit 1
  end

  arg = ARGV[0]

  if arg.downcase == 'server'
    test_process
  else
    # Check if custom name is provided
    custom_name = ARGV[1] if ARGV.length > 1
    test_upload_from_path(arg, custom_name)
  end
end