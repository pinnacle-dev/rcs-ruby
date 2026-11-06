# frozen_string_literal: true

require "json"
require_relative "../lib/rcs"

def assert_equal(expected, actual)
  raise "Expected #{expected.inspect}, received #{actual.inspect}" unless expected == actual
end

categories = { opt_in: { keywords: ["JOIN"], response: "Welcome" },
               opt_out: { keywords: ["LEAVE"], response: "Unsubscribed" },
               help: { keywords: ["SUPPORT"], response: "Contact support" } }
wire_categories = { "OPT_IN" => { "keywords" => ["JOIN"], "response" => "Welcome" },
                    "OPT_OUT" => { "keywords" => ["LEAVE"], "response" => "Unsubscribed" },
                    "HELP" => { "keywords" => ["SUPPORT"], "response" => "Contact support" } }
config = { "id" => "cfg_test", "campaignType" => "10DLC", "campaignId" => "campaign_test",
           "sender" => "+14155550101", "categories" => wire_categories,
           "createdAt" => "2026-11-06T12:00:00Z", "updatedAt" => "2026-11-06T12:00:00Z" }
client = Pinnacle::Client.new(api_key: "test-key", base_url: "https://sdk-verification.invalid/v2")
requests = []
connection = Class.new do
  attr_accessor :open_timeout, :read_timeout, :write_timeout, :continue_timeout
end.new
connection.define_singleton_method(:request) do |request|
  assert_equal("test-key", request["PINNACLE-API-KEY"])
  uri = URI(request.path)
  requests << [request.method, uri.path, URI.decode_www_form(uri.query || "").to_h, request.body && JSON.parse(request.body)]
  body = if request.method == "DELETE"
           { "success" => true }
         elsif ["/v2/keywords", "/v2/keywords/events", "/v2/keywords/subscriptions"].include?(uri.path) && request.method == "GET"
           { "items" => [], "total" => 0, "pageIndex" => 0, "pageSize" => 25 }
         elsif uri.path == "/v2/keywords/effective"
           config.merge("source" => "SENDER", "configurationId" => "cfg_test")
         else
           config
         end
  Struct.new(:code, :body).new("200", JSON.generate(body))
end
client.instance_variable_get(:@raw_client).define_singleton_method(:connect) { |_url| connection }
created = client.keywords.create(campaign_type: "10DLC", campaign_id: "campaign_test", sender: "+14155550101", categories: categories)
assert_equal("cfg_test", created.id)
assert_equal(wire_categories, requests.last[3]["categories"])
assert_equal("+14155550101", requests.last[3]["sender"])
client.keywords.get(id: "cfg_test")
client.keywords.update(id: "cfg_test", categories: categories)
client.keywords.list(campaign_type: "10DLC", campaign_id: "campaign_test", page_index: 2, page_size: 10)
assert_equal("2", requests.last[2]["pageIndex"])
client.keywords.list_subscriptions(recipient: "+14155550102")
assert_equal("+14155550102", requests.last[2]["recipient"])
client.keywords.list_events(sender: "+14155550101")
client.keywords.get_effective(sender: "+14155550101")
client.keywords.delete(id: "cfg_test")
assert_equal(%w[POST GET PUT GET GET GET GET DELETE], requests.map(&:first))
assert_equal(["/v2/keywords", "/v2/keywords/cfg_test", "/v2/keywords/cfg_test", "/v2/keywords", "/v2/keywords/subscriptions", "/v2/keywords/events", "/v2/keywords/effective", "/v2/keywords/cfg_test"], requests.map { |r| r[1] })
connection.define_singleton_method(:request) { |_request| Struct.new(:code, :body).new("403", JSON.generate(error: "Recipient opted out", code: "RECIPIENT_OPTED_OUT")) }
begin
  client.keywords.get(id: "cfg_test")
  raise "Expected forbidden error"
rescue Pinnacle::Errors::ForbiddenError => e
  assert_equal(403, e.code)
  assert_equal("RECIPIENT_OPTED_OUT", JSON.parse(e.message)["code"])
end
puts "Ruby keyword contracts passed: eight operations, models, wire aliases, filters, authentication, and error body."
