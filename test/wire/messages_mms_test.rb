# frozen_string_literal: true

require_relative "wiremock_test_case"

class MessagesMmsWireTest < WireMockTestCase
  def setup
    super

    @client = Pinnacle::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_messages_mms_send__with_wiremock
    test_id = "messages.mms.send_.0"

    @client.messages.mms.send_(
      from: "+14155164736",
      media_urls: ["https://fastly.picsum.photos/id/941/300/300.jpg?hmac=mDxM9PWSqRDjecwSCEpzU4bj35gqnG7yA25OL29uNv0"],
      options: {
        multiple_messages: true,
        validate: true
      },
      text: "Check out this image!",
      to: "+14154746461",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.mms.send_.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/send/mms",
      query_params: nil,
      expected: 1
    )
  end

  def test_messages_mms_validate_with_wiremock
    test_id = "messages.mms.validate.0"

    @client.messages.mms.validate(
      media_urls: ["https://upload.wikimedia.org/wikipedia/commons/b/b9/Pizigani_1367_Chart_1MB.jpg", "https://fastly.picsum.photos/id/528/1000/1000.jpg?hmac=aTG0xNif9KbNryFN0ZNZ_nFK6aEpZxqUGCZF1KjOT8w", "https://file-examples.com/storage/fefdd7ab126835e7993bb1a/2017/10/file_example_JPG_500kB.jpg"],
      text: "Check out these images!",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "messages.mms.validate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/messages/validate/mms",
      query_params: nil,
      expected: 1
    )
  end
end
