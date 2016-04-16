require 'webrick'
require 'openssl'
require 'base64'
require 'json'

require 'line/bot/message'

module Line
  module Bot
    class Server
      def initialize(args = {})
        @port           = args[:port] || 3000
        @bind           = args[:bind] || "0.0.0.0"
        @callback_path  = args[:callback_path] || '/linebot/callback'
        @channel_secret = args[:channel_secret]
        @channel_id     = args[:channel_id]
        @channel_mid    = args[:channel_mid]
      end

      def listen &block
        @serv = WEBrick::HTTPServer.new(BindAddress: @bind, Port: @port)
        @serv.mount_proc(@callback_path) do |request, response|
          http_request_body = request.body
          hash = OpenSSL::HMAC::digest(OpenSSL::Digest::SHA256.new, @channel_secret, http_request_body)
          signature = Base64.strict_encode64(hash)
          if signature != request.header["x-line-channelsignature"].first
            response.status = 401
            next
          end
          JSON.parse(request.body)['result'].map { |m| Message.new(m) }.each do |m|
            yield m
          end
        end

        trap(:INT){ @serv.shutdown }
        @serv.start
      end

    end
  end
end
