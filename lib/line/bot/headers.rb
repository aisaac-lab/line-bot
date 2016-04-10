module Line
  module Bot
    class Headers
      def initialize(client, request_method, url, options = {})
        @client         = client
        @request_method = request_method.to_sym
        @uri            = URI(url)
        @options        = options
      end

      def request_headers
        {
          'User-Agent'                   => @client.user_agent,
          'Content-Type'                 => 'application/json; charset=UTF-8',
          'X-Line-ChannelID'             => @client.channel_id,
          'X-Line-ChannelSecret'         => @client.channel_secret,
          'X-Line-Trusted-User-With-ACL' => @client.channel_mid
        }
      end
    end
  end
end
