require 'line/bot/client'
require 'line/bot/server'
require 'line/bot/constants'
module Line
  module Bot
    class Daemon
      # @param [Hash] args
      # @option args [String] :channel_id Line channel id. Required.
      # @option args [String] :channel_secret Line channel secret. Required.
      # @option args [String] :channel_mid Line channel mid. Required.
      # @option args [String] :proxy Proxy server used to send request to line api server. Required.
      # @option args [String] :port Port for callback request from line server. By Default: 3000.
      # @option args [String] :bind Bind address for callback request from line server. By default: "0.0.0.0".
      # @option args [String] :callback_path Callback entrypoint path used to send request to line's api server. By default: "/linebot/callback".
      def initialize(args = {})
        @clent = Client.new do |config|
          config.channel_id     = args[:channel_id]
          config.channel_secret = args[:channel_secret]
          config.channel_mid    = args[:channel_mid]
          config.proxy          = args[:proxy]
        end
        @serv = Server.new args
      end

      def run(&block)
        block.call(@serv, @clent)
      end
    end
  end
end
