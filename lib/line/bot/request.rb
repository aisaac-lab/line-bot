require 'line/bot/headers'

require 'faraday'
require 'faraday_middleware'

module Line
  module Bot
    class Request
      BASE_URL = 'https://trialbot-api.line.me'.freeze

      def initialize(client, request_method, path, options = {})
        @client         = client
        @request_method = request_method
        @uri            = URI(BASE_URL + path)
        @path           = @uri.path
        @options        = options
      end

      def perform
        response = http_client.send(@request_method) do |req|
          req.url @path
          req.headers = Line::Bot::Headers.new(@client, @request_method, @uri).request_headers
          req.params = @options
        end
        response.body
      end

      private
        def http_client
          @http_client ||= Faraday.new(url: BASE_URL) do |conn|
            conn.request :json
            conn.response :json, :content_type => /\bjson$/
            conn.adapter Faraday.default_adapter
            conn.proxy @proxy
          end
        end
    end
  end
end
