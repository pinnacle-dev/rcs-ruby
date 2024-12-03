# Pinnacle Ruby Library

The Pinnacle Ruby library provides access to the Pinnacle API from Ruby.

## Documentation

API reference documentation is available [here](docs.trypinnacle.app).

## Installation

Install the gem and add to your application's Gemfile by executing:

```sh
bundle add rcs
```

If bundler is not being used to manage dependencies, install the gem by executing:

```sh
gem install rcs
```

## Instantiation

```ruby
require "rcs"

client = Pinnacle::Client.new(api_key: "YOUR_API_KEY")
```


## Async Client
The SDK exports an async client that you can use for non-blocking requests.

```ruby
require "rcs"

client = Pinnacle::AsyncClient.new(api_key: "YOUR_API_KEY")

Sync do
  company = client.company.register(
    company: {
      name: "name",
      category: "Entertainment",
      address: "address",
      ein: "ein",
      description: "description",
      brand_color: "brandColor",
      logo_url: "logoUrl",
      hero_url: "heroUrl",
    },
    company_contact: {
      primary_website_url: "primaryWebsiteUrl",
      primary_website_label: "primaryWebsiteLabel",
      primary_phone: "primaryPhone",
      primary_phone_label: "primaryPhoneLabel",
      primary_email: "primaryEmail",
      primary_email_label: "primaryEmailLabel",
      privacy_policy_url: "privacyPolicyUrl",
      tos_url: "tosUrl",
    },
    messaging: {
      opt_in: "By opting in, you agree to receive messages from Pinnacle, including updates and promotions. Reply “STOP” to unsubscribe. Standard message and data rates may apply.",
      opt_out: "Reply with keywords like STOP or UNSUBSCRIBE to opt-out. A confirmation message will be sent, and no further messages will be received unless you re-subscribe.",
      opt_out_keywords: ["STOP", "UNSUBSCRIBE"],
      agent_use_case: "Pinnacle’s agent assists with product updates, promotions, order tracking, and support. It answers FAQs, provides order updates, and helps with opt-in/out processes. Escalates to live support when needed.",
      expected_agent_responses: "General Inquiry: “How can I assist you today?”\nOrder Status: “Provide your order number.”\nOpt-In: “You’re now subscribed!”\nOpt-Out: “You have unsubscribed.”\nEscalation: “Connecting to a live agent.”    \n",
    },
    point_of_contact: {
      poc_name: "pocName",
      poc_title: "pocTitle",
      poc_email: "pocEmail",
    },
  )
  puts company.to_json
end
```

## Timeouts

The SDK defaults to a 60 second timout. Use the `timeout_in_seconds` option to
configure this behavior.

```Ruby
client.company.register(
    ...,
    request_options: RequestOptions.new(
        timeout_in_seconds: 30
    )
)
```

## Retries

The SDK is instrumented with automatic retries with exponential backoff. A request will be
retried as long as the request is deemed retriable and the number of retry attempts has not grown larger
than the configured retry limit (default: 2).

A request is deemed retriable when any of the following HTTP status codes is returned:

- [408](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408) (Timeout)
- [409](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/409) (Conflict)
- [429](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429) (Too Many Requests)
- [5XX](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) (Internal Server Errors)

Use the `max_retries` request option to configure this behavior.

```Ruby
client.company.register(
    ...,
    request_options: RequestOptions.new(
        max_retries: 1
    )
)
```

## Beta status

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore,
we recommend pinning the package version to a specific version in your package.json file. This way, you can install
the same version each time without breaking changes unless you are intentionally looking for the latest version.
