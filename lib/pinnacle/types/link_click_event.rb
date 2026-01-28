# frozen_string_literal: true

module Pinnacle
  module Types
    class LinkClickEvent < Internal::Types::Model
      field :accept_language, -> { String }, optional: true, nullable: false
      field :accuracy_radius_km, -> { Integer }, optional: true, nullable: false
      field :asn, -> { Integer }, optional: true, nullable: false
      field :blocked_reason, -> { String }, optional: true, nullable: false
      field :ch_ua_brand, -> { String }, optional: true, nullable: false
      field :ch_ua_mobile, -> { String }, optional: true, nullable: false
      field :ch_ua_platform, -> { String }, optional: true, nullable: false
      field :city, -> { String }, optional: true, nullable: false
      field :color_depth, -> { Integer }, optional: true, nullable: false
      field :connection_type, -> { String }, optional: true, nullable: false
      field :country, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false
      field :error_details, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :fbclid, -> { String }, optional: true, nullable: false
      field :final_url, -> { String }, optional: true, nullable: false
      field :fingerprint_id, -> { String }, optional: true, nullable: false
      field :gclid, -> { String }, optional: true, nullable: false
      field :ip_address, -> { String }, optional: true, nullable: false
      field :ip_chain, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :is_bot, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :latency_ms, -> { Integer }, optional: true, nullable: false
      field :latitude, -> { Integer }, optional: true, nullable: false
      field :longitude, -> { Integer }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :method_, -> { String }, optional: true, nullable: false, api_name: "method"
      field :metro_code, -> { Integer }, optional: true, nullable: false
      field :network_downlink, -> { Integer }, optional: true, nullable: false
      field :network_rtt, -> { Integer }, optional: true, nullable: false
      field :performance_ttfb_ms, -> { Integer }, optional: true, nullable: false
      field :postal_code, -> { String }, optional: true, nullable: false
      field :redirect_hops, -> { Integer }, optional: true, nullable: false
      field :referrer, -> { String }, optional: true, nullable: false
      field :referrer_domain, -> { String }, optional: true, nullable: false
      field :region, -> { String }, optional: true, nullable: false
      field :resolved_at, -> { String }, optional: true, nullable: false
      field :screen_res, -> { String }, optional: true, nullable: false
      field :status_code, -> { Integer }, optional: true, nullable: false
      field :timezone_offset_min, -> { Integer }, optional: true, nullable: false
      field :tor_exit_node, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :ua_browser, -> { String }, optional: true, nullable: false
      field :ua_device, -> { String }, optional: true, nullable: false
      field :ua_os, -> { String }, optional: true, nullable: false
      field :ua_version, -> { String }, optional: true, nullable: false
      field :user_agent, -> { String }, optional: true, nullable: false
      field :utm_campaign, -> { String }, optional: true, nullable: false
      field :utm_content, -> { String }, optional: true, nullable: false
      field :utm_medium, -> { String }, optional: true, nullable: false
      field :utm_source, -> { String }, optional: true, nullable: false
      field :utm_term, -> { String }, optional: true, nullable: false
    end
  end
end
