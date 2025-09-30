# Test Scripts for RCS Ruby SDK

Simple test scripts to verify the `process` and `upload_from_path` methods from a user's perspective.

## Prerequisites

```bash
# 1. Ensure you're using Ruby 3.2.2 (or compatible version)
ruby -v

# 2. Install SDK dependencies (from project root)
cd /path/to/rcs-ruby
bundle install

# 3. Install test dependencies
cd user_test
bundle install
```

**Note:** The test scripts load the RCS SDK directly from `../lib`, so the gem doesn't need to be published.

## Configuration

Create a `.env` file in the root directory (`rcs-ruby/.env`) with your credentials:
```bash
PINNACLE_API_KEY="your-api-key-here"
PINNACLE_SIGNING_SECRET="your-signing-secret-here"
```

For webhook testing only, you can use a test secret:
```bash
PINNACLE_SIGNING_SECRET="test-webhook-secret"
```

The test scripts will automatically load environment variables from the `.env` file.

## Usage

### Test webhook processing
```bash
# Terminal 1: Start the server
cd user_test
ruby test.rb server

# Terminal 2: Send a test webhook using the helper script
cd user_test
ruby send_webhook.rb

# Or manually with curl
curl -X POST http://localhost:8080/webhook \
  -H 'Content-Type: application/json' \
  -H 'PINNACLE-SIGNING-SECRET: test-webhook-secret' \
  -d '{"type":"MESSAGE.RECEIVED","conversation":{"id":123,"from":"+14155551234","to":"+14155555678"},"status":"received","direction":"inbound","segments":1,"sentAt":"2024-01-01T00:00:00Z","message":{"id":"456","content":"Test message"}}'
```

### Test file upload
```bash
# Upload any file (requires valid PINNACLE_API_KEY in .env)
ruby test.rb /path/to/your/file.jpg

# Upload with custom name
ruby test.rb /path/to/your/file.jpg custom-name.jpg

# Examples
ruby test.rb image.png
ruby test.rb document.pdf
ruby test.rb video.mp4 "my-video.mp4"  # Upload with custom name
ruby test.rb ../lib/rcs.rb              # Relative path
ruby test.rb /path/to/file.jpg          # Absolute path
```

## Expected Output

### Successful webhook processing

**Server output (Terminal 1):**
```
🚀 Server running on http://localhost:8080/webhook
   Press Ctrl+C to stop

✅ Processed webhook:
   Type: MESSAGE.RECEIVED
   From: +14155551234
   To: +14155555678
   Message: Test message from webhook simulator
```

**Sender output (Terminal 2):**
```
✅ Webhook processed successfully!
   Response: {"status":"success"}
```

### Successful file upload
```
📁 Uploading: image.jpg
   Size: 245,678 bytes
✅ Upload successful!
   Download URL: https://storage.pinnacle.com/...
```

### Error scenarios
```
❌ PINNACLE_API_KEY environment variable is required
❌ File not found: /path/to/missing/file.jpg
❌ Upload failed: [error details]
```

## API Usage

The test scripts demonstrate the simplified API:

```ruby
# Initialize client
client = Pinnacle::Client.new(api_key: ENV['PINNACLE_API_KEY'])

# Process incoming webhooks
message_event = client.messages.process(request)

# Upload files from path
download_url = client.tools.file.upload_from_path("/path/to/file.jpg")
```

## Error Handling

All methods throw standard Faraday errors for consistency with the rest of the SDK:

```ruby
begin
  message_event = client.messages.process(request)
rescue Faraday::UnauthorizedError => e
  # Invalid webhook signature
  puts "Unauthorized: #{e.message}"
rescue ArgumentError => e
  # Invalid request object
  puts "Bad request: #{e.message}"
end

begin
  url = client.tools.file.upload_from_path("file.jpg")
rescue Faraday::ResourceNotFound => e
  # File not found
  puts "Not found: #{e.message}"
rescue Faraday::BadRequestError => e
  # Invalid file input
  puts "Bad request: #{e.message}"
rescue Faraday::ServerError => e
  # Upload failed
  puts "Server error: #{e.message}"
end
```

## Notes

- The webhook server requires `PINNACLE_SIGNING_SECRET` from your `.env` file for signature validation
- For webhook testing, you can use any test secret (e.g., `"test-webhook-secret"`)
- The `send_webhook.rb` script sends properly formatted webhook payloads to test the server
- Upload tests require a valid `PINNACLE_API_KEY` from your Pinnacle account
- The server runs on port 8080 by default
- Press `Ctrl+C` to stop the server
- If you get bundler errors, run `ruby test.rb` directly without `bundle exec`

## Files

- `test.rb` - Webhook server and file upload tests
- `send_webhook.rb` - Helper script to send webhook requests to the server
- `Gemfile` - Ruby dependencies for the test scripts
- `README.md` - This file