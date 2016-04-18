$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'line'
require 'pry'

require 'minitest/autorun'

$client = Line::Bot::Client.new do |config|
  config.channel_id     = ENV["LINE_CHANNEL_ID"]
  config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  config.channel_mid    = ENV["LINE_CHANNEL_MID"]
  config.proxy          = ENV["LINE_BOT_PROXY_URL"]
end

$client_with_proxy = Line::Bot::Client.new do |config|
  config.channel_id     = ENV["LINE_CHANNEL_ID"]
  config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  config.channel_mid    = ENV["LINE_CHANNEL_MID"]
end
