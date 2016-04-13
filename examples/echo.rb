require 'line/bot/daemon'

Line::Bot::Daemon.run(channel_id: ENV['LINE_CHANNEL_ID'],
                      channel_secret: ENV['LINE_CHANNEL_SECRET'],
                      channel_mid: ENV['LINE_CHANNEL_MID'],
                      proxy: ENV['PROXY'],
                      port: ENV['PORT'] || 5000) do |bot|
  bot.listen do |message|
    bot.api.send_text([message.content.from], text: message.content.text)
  end
end
