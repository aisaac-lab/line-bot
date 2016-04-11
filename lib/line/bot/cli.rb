require 'thor'

module Line
  module Bot
    class Cli < Thor
      package_name 'line-bot'

      option :'--line-channel-id', type: 'string', default: ENV['LINE_CHANNEL_ID']
      option :'--line-channel-secret', type: 'string', default: ENV['LINE_CHANNEL_SECRET']
      option :'--line-channel-mid', type: 'string', default: ENV['LINE_CHANNEL_MID']
      option :'--proxy', type: 'string', default: ENV['PROXY']

      desc 'get_profiles MID', 'get profile for MID'
      def get_profiles(mids)
        puts pretty_json api_client.get_profiles mids.split(',')
      end

      desc 'send_text MIDS_OF_TARGET_RECIPIENT TEXT', 'send TEXT to MIDS_OF_TARGET_RECIPIENT'
      def send_text(mids_of_target_recipient, text)
        puts pretty_json api_client.send_text(mids_of_target_recipient.split(','), text: text)
      end

      desc 'get_message_context MESSAGE_ID', 'get message context of MESSAGE_ID'
      def get_message_context(messageId)
        puts pretty_json api_client.get_message_content messageId
      end

      private

      def pretty_json object
        JSON.pretty_generate(object)
      end

      def api_client
        Line::Bot::Client.new do |config|
          config.channel_id     = options[:'line-channel-id']
          config.channel_secret = options[:'line-channel-secret']
          config.channel_mid    = options[:'line-channel-mid']
          config.proxy          = options[:'proxy']
        end
      end

    end
  end
end
