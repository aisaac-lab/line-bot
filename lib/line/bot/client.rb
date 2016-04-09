require 'line/bot/version'
require 'line/bot/api'

module Line
  module Bot
    class Client
      include Line::Bot::API
      attr_accessor :channel_id, :channel_secret, :channel_mid

      def initialize
        yield(self) if block_given?
      end

      def credentials
        {
          channel_id:     channel_id,
          channel_secret: channel_secret,
          channel_mid:    channel_mid
        }
      end

      def credentials?
        credentials.values.all?
      end

      def user_agent
        "LineBotGem/#{Line::Bot::VERSION}"
      end
    end
  end
end
