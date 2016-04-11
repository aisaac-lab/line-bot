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
          if @request_method == :get
            req.params = @options unless @options == {}
          else
            req.body = @options.to_json
          end
        end

        {
          status: response.status,
          body: response.body
        }
      end

      private
        def http_client
          @http_client ||= Faraday.new(url: BASE_URL, ssl: { verify: false }) do |conn|
            conn.request :json
            conn.response :json, :content_type => /\bjson$/
            conn.adapter Faraday.default_adapter
            if @client.proxy
              conn.proxy @client.proxy
            end
          end
        end
    end
  end
end
