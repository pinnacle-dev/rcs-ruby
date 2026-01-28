# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesBlastWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_blast_sms_with_wiremock
    test_id = "messages.blast.sms.0"

    @client.messages.blast.sms(
      audience_id: "aud_abc123",
      senders: ["+14155164736", "+14155164737"],
      message: {
        text: "Hello from Pinnacle!"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.blast.sms.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/blast/sms",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_blast_mms_with_wiremock
    test_id = "messages.blast.mms.0"

    @client.messages.blast.mms(
      audience_id: "aud_abc123",
      senders: ["+14155164736", "+14155164737"],
      message: {
        media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg"],
        text: "Check out this image!"
      },
      options: {
        validate: true
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.blast.mms.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/blast/mms",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_blast_rcs_with_wiremock
    test_id = "messages.blast.rcs.0"

    @client.messages.blast.rcs(
      audience_id: "aud_abc123",
      senders: %w[agent_pinnacle agent_pinnacle2],
      message: {
        quick_replies: [],
        text: "Hello from Pinnacle RCS!"
      },
      options: {
        transcode: true,
        validate: true
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.blast.rcs.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/blast/rcs",
      query_params: nil,
      expected: 1
    )
  end
end
