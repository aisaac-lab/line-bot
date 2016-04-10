# Line::Bot

[![Gem Version](https://badge.fury.io/rb/line-bot.svg)](https://badge.fury.io/rb/line-bot)

A lightweight, flexible Ruby interface to the Line Bot API.

## Installation

    $ gem install line-bot

## Usage

```ruby
require 'line/bot/client'

client = Line::Bot::Client.new do |config|
  config.channel_id     = "LINE_CHANNEL_ID"
  config.channel_secret = "LINE_CHANNEL_SECRET"
  config.channel_mid    = "LINE_CHANNEL_MID"
end

client.get_profiles(["uxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"])
# => {
# :status=>200,
# :body=>{"contacts"=>[{"displayName"=>"Aisaac", "mid"=>"uxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", "pictureUrl"=>"",# "statusMessage"=>""}],
#   "count"=>1,
#   "display"=>1,
#   "pagingRequest"=>{"start"=>1, "display"=>1, "sortBy"=>"MID"},
#   "start"=>1,
#   "total"=>1}
# }

client.send_text(["uxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"], "Hello, world!")
#=> {:status=>200, :body=>{"failed"=>[], "messageId"=>"1460267791059", "timestamp"=>1460267791059, "version"=>1}}

client.get_message_content("1460267791059")
# => {
# :status=>200,
# :body=> {"result":[
#     {
#       "content":{
#         "toType":1,
#         ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ai-saac/line-bot.

I'm open to any suggestions :) Please feel free to open issues!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
