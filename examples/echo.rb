require 'line/bot/daemon'

daemon = Line::Bot::Daemon.new({
  channel_id:     ENV['LINE_CHANNEL_ID'],
  channel_secret: ENV['LINE_CHANNEL_SECRET'],
  channel_mid:    ENV['LINE_CHANNEL_MID'],
  proxy:          ENV['PROXY'],
  port:           ENV['PORT'] || 5000
})

daemon.run do |server, client|
  server.listen do |message|
    client.send_text([message.content.from], text: message.content.text)
  end
end
