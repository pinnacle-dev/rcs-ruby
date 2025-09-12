# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class LinkClickEvent
    # @return [String] Accept-Language header value.
    attr_reader :accept_language
    # @return [Integer] Accuracy radius for geographic coordinates in kilometers.
    attr_reader :accuracy_radius_km
    # @return [Integer] Autonomous System Number.
    attr_reader :asn
    # @return [String] Reason why the request was blocked (if applicable).
    attr_reader :blocked_reason
    # @return [String] User-Agent Client Hint brand.
    attr_reader :ch_ua_brand
    # @return [String] User-Agent Client Hint mobile indicator.
    attr_reader :ch_ua_mobile
    # @return [String] User-Agent Client Hint platform.
    attr_reader :ch_ua_platform
    # @return [String] City name.
    attr_reader :city
    # @return [Integer] Color depth in bits.
    attr_reader :color_depth
    # @return [String] Type of internet connection.
    attr_reader :connection_type
    # @return [String] Country code (ISO 3166-1 alpha-2).
    attr_reader :country
    # @return [String] Timestamp when the click occurred in ISO 8601 format.
    attr_reader :created_at
    # @return [Hash{String => Object}] Error details if the request failed.
    attr_reader :error_details
    # @return [String] Facebook Click Identifier.
    attr_reader :fbclid
    # @return [String] Final resolved URL after redirects.
    attr_reader :final_url
    # @return [String] Unique fingerprint identifier for the client.
    attr_reader :fingerprint_id
    # @return [String] Google Click Identifier.
    attr_reader :gclid
    # @return [Integer] Unique identifier for the click event.
    attr_reader :id
    # @return [String] IP address of the visitor (may be anonymized).
    attr_reader :ip_address
    # @return [Array<String>] Chain of IP addresses for proxied requests.
    attr_reader :ip_chain
    # @return [Boolean] Whether the request was identified as coming from a bot.
    attr_reader :is_bot
    # @return [Integer] Request latency in milliseconds.
    attr_reader :latency_ms
    # @return [Float] Geographic latitude.
    attr_reader :latitude
    # @return [Integer] ID of your shortened URL.
    attr_reader :link_id
    # @return [Float] Geographic longitude.
    attr_reader :longitude
    # @return [Hash{String => Object}] Additional metadata as JSON object.
    attr_reader :metadata
    # @return [String] HTTP method used.
    attr_reader :method
    # @return [Integer] Metro area code.
    attr_reader :metro_code
    # @return [Float] Network downlink speed estimate in Mbps.
    attr_reader :network_downlink
    # @return [Integer] Network round-trip time in milliseconds.
    attr_reader :network_rtt
    # @return [Integer] Time to first byte in milliseconds,.
    attr_reader :performance_ttfb_ms
    # @return [String] Postal/ZIP code.
    attr_reader :postal_code
    # @return [Integer] Number of redirect hops to reach final destination.
    attr_reader :redirect_hops
    # @return [String] The referring URL.
    attr_reader :referrer
    # @return [String] Domain of the referring URL.
    attr_reader :referrer_domain
    # @return [String] Region or state.
    attr_reader :region
    # @return [String] Timestamp when the redirect was resolved in ISO 8601 format.
    attr_reader :resolved_at
    # @return [String] Screen resolution.
    attr_reader :screen_res
    # @return [Integer] HTTP status code of the response.
    attr_reader :status_code
    # @return [Integer] Timezone offset in minutes from UTC.
    attr_reader :timezone_offset_min
    # @return [Boolean] Whether the request came from a Tor exit node.
    attr_reader :tor_exit_node
    # @return [String] Browser name.
    attr_reader :ua_browser
    # @return [String] Device type.
    attr_reader :ua_device
    # @return [String] Operating system.
    attr_reader :ua_os
    # @return [String] Browser version.
    attr_reader :ua_version
    # @return [String] User agent string from the browser.
    attr_reader :user_agent
    # @return [String] UTM campaign parameter.
    attr_reader :utm_campaign
    # @return [String] UTM content parameter.
    attr_reader :utm_content
    # @return [String] UTM medium parameter.
    attr_reader :utm_medium
    # @return [String] UTM source parameter.
    attr_reader :utm_source
    # @return [String] UTM term.
    attr_reader :utm_term
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param accept_language [String] Accept-Language header value.
    # @param accuracy_radius_km [Integer] Accuracy radius for geographic coordinates in kilometers.
    # @param asn [Integer] Autonomous System Number.
    # @param blocked_reason [String] Reason why the request was blocked (if applicable).
    # @param ch_ua_brand [String] User-Agent Client Hint brand.
    # @param ch_ua_mobile [String] User-Agent Client Hint mobile indicator.
    # @param ch_ua_platform [String] User-Agent Client Hint platform.
    # @param city [String] City name.
    # @param color_depth [Integer] Color depth in bits.
    # @param connection_type [String] Type of internet connection.
    # @param country [String] Country code (ISO 3166-1 alpha-2).
    # @param created_at [String] Timestamp when the click occurred in ISO 8601 format.
    # @param error_details [Hash{String => Object}] Error details if the request failed.
    # @param fbclid [String] Facebook Click Identifier.
    # @param final_url [String] Final resolved URL after redirects.
    # @param fingerprint_id [String] Unique fingerprint identifier for the client.
    # @param gclid [String] Google Click Identifier.
    # @param id [Integer] Unique identifier for the click event.
    # @param ip_address [String] IP address of the visitor (may be anonymized).
    # @param ip_chain [Array<String>] Chain of IP addresses for proxied requests.
    # @param is_bot [Boolean] Whether the request was identified as coming from a bot.
    # @param latency_ms [Integer] Request latency in milliseconds.
    # @param latitude [Float] Geographic latitude.
    # @param link_id [Integer] ID of your shortened URL.
    # @param longitude [Float] Geographic longitude.
    # @param metadata [Hash{String => Object}] Additional metadata as JSON object.
    # @param method [String] HTTP method used.
    # @param metro_code [Integer] Metro area code.
    # @param network_downlink [Float] Network downlink speed estimate in Mbps.
    # @param network_rtt [Integer] Network round-trip time in milliseconds.
    # @param performance_ttfb_ms [Integer] Time to first byte in milliseconds,.
    # @param postal_code [String] Postal/ZIP code.
    # @param redirect_hops [Integer] Number of redirect hops to reach final destination.
    # @param referrer [String] The referring URL.
    # @param referrer_domain [String] Domain of the referring URL.
    # @param region [String] Region or state.
    # @param resolved_at [String] Timestamp when the redirect was resolved in ISO 8601 format.
    # @param screen_res [String] Screen resolution.
    # @param status_code [Integer] HTTP status code of the response.
    # @param timezone_offset_min [Integer] Timezone offset in minutes from UTC.
    # @param tor_exit_node [Boolean] Whether the request came from a Tor exit node.
    # @param ua_browser [String] Browser name.
    # @param ua_device [String] Device type.
    # @param ua_os [String] Operating system.
    # @param ua_version [String] Browser version.
    # @param user_agent [String] User agent string from the browser.
    # @param utm_campaign [String] UTM campaign parameter.
    # @param utm_content [String] UTM content parameter.
    # @param utm_medium [String] UTM medium parameter.
    # @param utm_source [String] UTM source parameter.
    # @param utm_term [String] UTM term.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::LinkClickEvent]
    def initialize(created_at:, id:, link_id:, accept_language: OMIT, accuracy_radius_km: OMIT, asn: OMIT, blocked_reason: OMIT, ch_ua_brand: OMIT,
                   ch_ua_mobile: OMIT, ch_ua_platform: OMIT, city: OMIT, color_depth: OMIT, connection_type: OMIT, country: OMIT, error_details: OMIT, fbclid: OMIT, final_url: OMIT, fingerprint_id: OMIT, gclid: OMIT, ip_address: OMIT, ip_chain: OMIT, is_bot: OMIT, latency_ms: OMIT, latitude: OMIT, longitude: OMIT, metadata: OMIT, method: OMIT, metro_code: OMIT, network_downlink: OMIT, network_rtt: OMIT, performance_ttfb_ms: OMIT, postal_code: OMIT, redirect_hops: OMIT, referrer: OMIT, referrer_domain: OMIT, region: OMIT, resolved_at: OMIT, screen_res: OMIT, status_code: OMIT, timezone_offset_min: OMIT, tor_exit_node: OMIT, ua_browser: OMIT, ua_device: OMIT, ua_os: OMIT, ua_version: OMIT, user_agent: OMIT, utm_campaign: OMIT, utm_content: OMIT, utm_medium: OMIT, utm_source: OMIT, utm_term: OMIT, additional_properties: nil)
      @accept_language = accept_language if accept_language != OMIT
      @accuracy_radius_km = accuracy_radius_km if accuracy_radius_km != OMIT
      @asn = asn if asn != OMIT
      @blocked_reason = blocked_reason if blocked_reason != OMIT
      @ch_ua_brand = ch_ua_brand if ch_ua_brand != OMIT
      @ch_ua_mobile = ch_ua_mobile if ch_ua_mobile != OMIT
      @ch_ua_platform = ch_ua_platform if ch_ua_platform != OMIT
      @city = city if city != OMIT
      @color_depth = color_depth if color_depth != OMIT
      @connection_type = connection_type if connection_type != OMIT
      @country = country if country != OMIT
      @created_at = created_at
      @error_details = error_details if error_details != OMIT
      @fbclid = fbclid if fbclid != OMIT
      @final_url = final_url if final_url != OMIT
      @fingerprint_id = fingerprint_id if fingerprint_id != OMIT
      @gclid = gclid if gclid != OMIT
      @id = id
      @ip_address = ip_address if ip_address != OMIT
      @ip_chain = ip_chain if ip_chain != OMIT
      @is_bot = is_bot if is_bot != OMIT
      @latency_ms = latency_ms if latency_ms != OMIT
      @latitude = latitude if latitude != OMIT
      @link_id = link_id
      @longitude = longitude if longitude != OMIT
      @metadata = metadata if metadata != OMIT
      @method = method if method != OMIT
      @metro_code = metro_code if metro_code != OMIT
      @network_downlink = network_downlink if network_downlink != OMIT
      @network_rtt = network_rtt if network_rtt != OMIT
      @performance_ttfb_ms = performance_ttfb_ms if performance_ttfb_ms != OMIT
      @postal_code = postal_code if postal_code != OMIT
      @redirect_hops = redirect_hops if redirect_hops != OMIT
      @referrer = referrer if referrer != OMIT
      @referrer_domain = referrer_domain if referrer_domain != OMIT
      @region = region if region != OMIT
      @resolved_at = resolved_at if resolved_at != OMIT
      @screen_res = screen_res if screen_res != OMIT
      @status_code = status_code if status_code != OMIT
      @timezone_offset_min = timezone_offset_min if timezone_offset_min != OMIT
      @tor_exit_node = tor_exit_node if tor_exit_node != OMIT
      @ua_browser = ua_browser if ua_browser != OMIT
      @ua_device = ua_device if ua_device != OMIT
      @ua_os = ua_os if ua_os != OMIT
      @ua_version = ua_version if ua_version != OMIT
      @user_agent = user_agent if user_agent != OMIT
      @utm_campaign = utm_campaign if utm_campaign != OMIT
      @utm_content = utm_content if utm_content != OMIT
      @utm_medium = utm_medium if utm_medium != OMIT
      @utm_source = utm_source if utm_source != OMIT
      @utm_term = utm_term if utm_term != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "accept_language": accept_language,
        "accuracy_radius_km": accuracy_radius_km,
        "asn": asn,
        "blocked_reason": blocked_reason,
        "ch_ua_brand": ch_ua_brand,
        "ch_ua_mobile": ch_ua_mobile,
        "ch_ua_platform": ch_ua_platform,
        "city": city,
        "color_depth": color_depth,
        "connection_type": connection_type,
        "country": country,
        "created_at": created_at,
        "error_details": error_details,
        "fbclid": fbclid,
        "final_url": final_url,
        "fingerprint_id": fingerprint_id,
        "gclid": gclid,
        "id": id,
        "ip_address": ip_address,
        "ip_chain": ip_chain,
        "is_bot": is_bot,
        "latency_ms": latency_ms,
        "latitude": latitude,
        "link_id": link_id,
        "longitude": longitude,
        "metadata": metadata,
        "method": method,
        "metro_code": metro_code,
        "network_downlink": network_downlink,
        "network_rtt": network_rtt,
        "performance_ttfb_ms": performance_ttfb_ms,
        "postal_code": postal_code,
        "redirect_hops": redirect_hops,
        "referrer": referrer,
        "referrer_domain": referrer_domain,
        "region": region,
        "resolved_at": resolved_at,
        "screen_res": screen_res,
        "status_code": status_code,
        "timezone_offset_min": timezone_offset_min,
        "tor_exit_node": tor_exit_node,
        "ua_browser": ua_browser,
        "ua_device": ua_device,
        "ua_os": ua_os,
        "ua_version": ua_version,
        "user_agent": user_agent,
        "utm_campaign": utm_campaign,
        "utm_content": utm_content,
        "utm_medium": utm_medium,
        "utm_source": utm_source,
        "utm_term": utm_term
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LinkClickEvent
    #
    # @param json_object [String]
    # @return [Pinnacle::LinkClickEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      accept_language = parsed_json["accept_language"]
      accuracy_radius_km = parsed_json["accuracy_radius_km"]
      asn = parsed_json["asn"]
      blocked_reason = parsed_json["blocked_reason"]
      ch_ua_brand = parsed_json["ch_ua_brand"]
      ch_ua_mobile = parsed_json["ch_ua_mobile"]
      ch_ua_platform = parsed_json["ch_ua_platform"]
      city = parsed_json["city"]
      color_depth = parsed_json["color_depth"]
      connection_type = parsed_json["connection_type"]
      country = parsed_json["country"]
      created_at = parsed_json["created_at"]
      error_details = parsed_json["error_details"]
      fbclid = parsed_json["fbclid"]
      final_url = parsed_json["final_url"]
      fingerprint_id = parsed_json["fingerprint_id"]
      gclid = parsed_json["gclid"]
      id = parsed_json["id"]
      ip_address = parsed_json["ip_address"]
      ip_chain = parsed_json["ip_chain"]
      is_bot = parsed_json["is_bot"]
      latency_ms = parsed_json["latency_ms"]
      latitude = parsed_json["latitude"]
      link_id = parsed_json["link_id"]
      longitude = parsed_json["longitude"]
      metadata = parsed_json["metadata"]
      method = parsed_json["method"]
      metro_code = parsed_json["metro_code"]
      network_downlink = parsed_json["network_downlink"]
      network_rtt = parsed_json["network_rtt"]
      performance_ttfb_ms = parsed_json["performance_ttfb_ms"]
      postal_code = parsed_json["postal_code"]
      redirect_hops = parsed_json["redirect_hops"]
      referrer = parsed_json["referrer"]
      referrer_domain = parsed_json["referrer_domain"]
      region = parsed_json["region"]
      resolved_at = parsed_json["resolved_at"]
      screen_res = parsed_json["screen_res"]
      status_code = parsed_json["status_code"]
      timezone_offset_min = parsed_json["timezone_offset_min"]
      tor_exit_node = parsed_json["tor_exit_node"]
      ua_browser = parsed_json["ua_browser"]
      ua_device = parsed_json["ua_device"]
      ua_os = parsed_json["ua_os"]
      ua_version = parsed_json["ua_version"]
      user_agent = parsed_json["user_agent"]
      utm_campaign = parsed_json["utm_campaign"]
      utm_content = parsed_json["utm_content"]
      utm_medium = parsed_json["utm_medium"]
      utm_source = parsed_json["utm_source"]
      utm_term = parsed_json["utm_term"]
      new(
        accept_language: accept_language,
        accuracy_radius_km: accuracy_radius_km,
        asn: asn,
        blocked_reason: blocked_reason,
        ch_ua_brand: ch_ua_brand,
        ch_ua_mobile: ch_ua_mobile,
        ch_ua_platform: ch_ua_platform,
        city: city,
        color_depth: color_depth,
        connection_type: connection_type,
        country: country,
        created_at: created_at,
        error_details: error_details,
        fbclid: fbclid,
        final_url: final_url,
        fingerprint_id: fingerprint_id,
        gclid: gclid,
        id: id,
        ip_address: ip_address,
        ip_chain: ip_chain,
        is_bot: is_bot,
        latency_ms: latency_ms,
        latitude: latitude,
        link_id: link_id,
        longitude: longitude,
        metadata: metadata,
        method: method,
        metro_code: metro_code,
        network_downlink: network_downlink,
        network_rtt: network_rtt,
        performance_ttfb_ms: performance_ttfb_ms,
        postal_code: postal_code,
        redirect_hops: redirect_hops,
        referrer: referrer,
        referrer_domain: referrer_domain,
        region: region,
        resolved_at: resolved_at,
        screen_res: screen_res,
        status_code: status_code,
        timezone_offset_min: timezone_offset_min,
        tor_exit_node: tor_exit_node,
        ua_browser: ua_browser,
        ua_device: ua_device,
        ua_os: ua_os,
        ua_version: ua_version,
        user_agent: user_agent,
        utm_campaign: utm_campaign,
        utm_content: utm_content,
        utm_medium: utm_medium,
        utm_source: utm_source,
        utm_term: utm_term,
        additional_properties: struct
      )
    end

    # Serialize an instance of LinkClickEvent to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.accept_language&.is_a?(String) != false || raise("Passed value for field obj.accept_language is not the expected type, validation failed.")
      obj.accuracy_radius_km&.is_a?(Integer) != false || raise("Passed value for field obj.accuracy_radius_km is not the expected type, validation failed.")
      obj.asn&.is_a?(Integer) != false || raise("Passed value for field obj.asn is not the expected type, validation failed.")
      obj.blocked_reason&.is_a?(String) != false || raise("Passed value for field obj.blocked_reason is not the expected type, validation failed.")
      obj.ch_ua_brand&.is_a?(String) != false || raise("Passed value for field obj.ch_ua_brand is not the expected type, validation failed.")
      obj.ch_ua_mobile&.is_a?(String) != false || raise("Passed value for field obj.ch_ua_mobile is not the expected type, validation failed.")
      obj.ch_ua_platform&.is_a?(String) != false || raise("Passed value for field obj.ch_ua_platform is not the expected type, validation failed.")
      obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
      obj.color_depth&.is_a?(Integer) != false || raise("Passed value for field obj.color_depth is not the expected type, validation failed.")
      obj.connection_type&.is_a?(String) != false || raise("Passed value for field obj.connection_type is not the expected type, validation failed.")
      obj.country&.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.created_at.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.error_details&.is_a?(Hash) != false || raise("Passed value for field obj.error_details is not the expected type, validation failed.")
      obj.fbclid&.is_a?(String) != false || raise("Passed value for field obj.fbclid is not the expected type, validation failed.")
      obj.final_url&.is_a?(String) != false || raise("Passed value for field obj.final_url is not the expected type, validation failed.")
      obj.fingerprint_id&.is_a?(String) != false || raise("Passed value for field obj.fingerprint_id is not the expected type, validation failed.")
      obj.gclid&.is_a?(String) != false || raise("Passed value for field obj.gclid is not the expected type, validation failed.")
      obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.ip_address&.is_a?(String) != false || raise("Passed value for field obj.ip_address is not the expected type, validation failed.")
      obj.ip_chain&.is_a?(Array) != false || raise("Passed value for field obj.ip_chain is not the expected type, validation failed.")
      obj.is_bot&.is_a?(Boolean) != false || raise("Passed value for field obj.is_bot is not the expected type, validation failed.")
      obj.latency_ms&.is_a?(Integer) != false || raise("Passed value for field obj.latency_ms is not the expected type, validation failed.")
      obj.latitude&.is_a?(Float) != false || raise("Passed value for field obj.latitude is not the expected type, validation failed.")
      obj.link_id.is_a?(Integer) != false || raise("Passed value for field obj.link_id is not the expected type, validation failed.")
      obj.longitude&.is_a?(Float) != false || raise("Passed value for field obj.longitude is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.method&.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
      obj.metro_code&.is_a?(Integer) != false || raise("Passed value for field obj.metro_code is not the expected type, validation failed.")
      obj.network_downlink&.is_a?(Float) != false || raise("Passed value for field obj.network_downlink is not the expected type, validation failed.")
      obj.network_rtt&.is_a?(Integer) != false || raise("Passed value for field obj.network_rtt is not the expected type, validation failed.")
      obj.performance_ttfb_ms&.is_a?(Integer) != false || raise("Passed value for field obj.performance_ttfb_ms is not the expected type, validation failed.")
      obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
      obj.redirect_hops&.is_a?(Integer) != false || raise("Passed value for field obj.redirect_hops is not the expected type, validation failed.")
      obj.referrer&.is_a?(String) != false || raise("Passed value for field obj.referrer is not the expected type, validation failed.")
      obj.referrer_domain&.is_a?(String) != false || raise("Passed value for field obj.referrer_domain is not the expected type, validation failed.")
      obj.region&.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
      obj.resolved_at&.is_a?(String) != false || raise("Passed value for field obj.resolved_at is not the expected type, validation failed.")
      obj.screen_res&.is_a?(String) != false || raise("Passed value for field obj.screen_res is not the expected type, validation failed.")
      obj.status_code&.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
      obj.timezone_offset_min&.is_a?(Integer) != false || raise("Passed value for field obj.timezone_offset_min is not the expected type, validation failed.")
      obj.tor_exit_node&.is_a?(Boolean) != false || raise("Passed value for field obj.tor_exit_node is not the expected type, validation failed.")
      obj.ua_browser&.is_a?(String) != false || raise("Passed value for field obj.ua_browser is not the expected type, validation failed.")
      obj.ua_device&.is_a?(String) != false || raise("Passed value for field obj.ua_device is not the expected type, validation failed.")
      obj.ua_os&.is_a?(String) != false || raise("Passed value for field obj.ua_os is not the expected type, validation failed.")
      obj.ua_version&.is_a?(String) != false || raise("Passed value for field obj.ua_version is not the expected type, validation failed.")
      obj.user_agent&.is_a?(String) != false || raise("Passed value for field obj.user_agent is not the expected type, validation failed.")
      obj.utm_campaign&.is_a?(String) != false || raise("Passed value for field obj.utm_campaign is not the expected type, validation failed.")
      obj.utm_content&.is_a?(String) != false || raise("Passed value for field obj.utm_content is not the expected type, validation failed.")
      obj.utm_medium&.is_a?(String) != false || raise("Passed value for field obj.utm_medium is not the expected type, validation failed.")
      obj.utm_source&.is_a?(String) != false || raise("Passed value for field obj.utm_source is not the expected type, validation failed.")
      obj.utm_term&.is_a?(String) != false || raise("Passed value for field obj.utm_term is not the expected type, validation failed.")
    end
  end
end
