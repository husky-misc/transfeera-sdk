require 'rest_client'
require 'json'
require 'addressable/uri'

module TransfeeraSDK
  class Base
    BASE_URL = 'https://api.transfeera.com'

    def send_request(verb, path, options = {})
      timestamp = (Time.now.to_f * 1000).round.to_s
      payload   = options.empty? || verb == :get ? nil : JSON.dump(options)
      query     = options.any? && verb == :get ? "?#{URI.encode_www_form(options)}" : ''
      url       = "#{BASE_URL}#{path}#{query.gsub("%E2%80%8B", "")}"

      headers = {
        authorization: TransfeeraSDK.token,
        user_agent:    TransfeeraSDK.user_agent,
        content_type:  'application/json'
      }

      begin
        response = RestClient::Request.execute(
          :method => verb,
          :url => url,
          :payload => payload,
          :headers => headers)
      rescue => e
        response = e.response.body
      end

      JSON.parse(response.to_str) if response.to_s
    end
  end
end
