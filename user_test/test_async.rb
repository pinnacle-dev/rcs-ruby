#!/usr/bin/env ruby
# frozen_string_literal: true

=begin
Async test file for RCS SDK from user's perspective.
Usage:
  bundle exec ruby test_async.rb path/to/file.jpg  # Test async upload_from_path
  bundle exec ruby test_async.rb server            # Test async process with mock server
=end

require 'bundler/setup'
require 'dotenv'
require 'async'

# Load .env from project root (parent directory)
Dotenv.load(File.expand_path('../.env', __dir__))

# Add the lib directory to the load path
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'rcs'

def test_async_process
  # Run a Rack-based async server to test webhook processing
  begin
    require 'rackup'
    require 'json'
  rescue LoadError
    puts "❌ Rackup is required. Install with: gem install rackup"
    exit 1
  end

  # Initialize the SDK
  api_key = ENV['PINNACLE_API_KEY']
  client = Pinnacle::AsyncClient.new(api_key: api_key)

  # Create a Rack app
  app = Proc.new do |env|
    request = Rack::Request.new(env)

    if request.post? && request.path == '/webhook'
      begin
        Async do
          message_event = client.messages.process(request).wait

          puts "\n✅ Processed async webhook (Rack):"
          puts "   Type: #{message_event.type}"
          puts "   From: #{message_event.conversation.from}"
          puts "   To: #{message_event.conversation.to}"
          puts "   Message: #{message_event.message.content}" if message_event.message.content

          [200, { 'Content-Type' => 'application/json' }, [{ status: 'success' }.to_json]]
        end.wait
      rescue Faraday::UnauthorizedError => e
        puts "\n❌ Unauthorized: #{e.message}"
        [401, { 'Content-Type' => 'application/json' }, [{ error: e.message }.to_json]]
      rescue => e
        puts "\n❌ Error: #{e.message}"
        puts e.backtrace.first(5)
        [400, { 'Content-Type' => 'application/json' }, [{ error: e.message }.to_json]]
      end
    else
      [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end

  # Start server
  puts "🚀 Async Rack server running on http://localhost:8080/webhook"
  puts "   Press Ctrl+C to stop"

  Rackup::Handler.get('puma').run(app, Port: 8080, Host: '0.0.0.0', Silent: true)
end

def test_async_upload_from_path(file_path, custom_name = nil)
  # Test uploading a file asynchronously
  # Check API key
  api_key = ENV['PINNACLE_API_KEY']
  unless api_key
    puts "❌ PINNACLE_API_KEY environment variable is required"
    exit 1
  end

  # Initialize the SDK
  client = Pinnacle::AsyncClient.new(api_key: api_key)

  # Check file exists
  unless File.exist?(file_path)
    puts "❌ File not found: #{file_path}"
    exit 1
  end

  puts "📁 Uploading async: #{file_path}"
  puts "   Custom name: #{custom_name}" if custom_name
  puts "   Size: #{File.size(file_path).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} bytes"

  begin
    Async do
      download_url = client.tools.file.upload_from_path(
        file_path,
        name: custom_name
      ).wait

      puts "✅ Async upload successful!"
      puts "   Download URL: #{download_url}"
    end.wait
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
    puts "Async test file for RCS SDK from user's perspective."
    puts "\nUsage:"
    puts "  ruby test_async.rb server                     # Run async webhook server"
    puts "  ruby test_async.rb <file_path>                # Upload file asynchronously"
    puts "  ruby test_async.rb <file_path> <custom_name>  # Upload with custom name"
    exit 1
  end

  arg = ARGV[0]

  if arg.downcase == 'server'
    test_async_process
  else
    # Check if custom name is provided
    custom_name = ARGV[1] if ARGV.length > 1
    test_async_upload_from_path(arg, custom_name)
  end
end
