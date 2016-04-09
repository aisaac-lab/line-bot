# Line::Bot

[![Gem Version](https://badge.fury.io/rb/line-bot.svg)](https://badge.fury.io/rb/line-bot)

A lightweight, flexible Ruby interface to the Line Bot API.

## Installation

    $ gem install line-bot

## Usage

```ruby
client = Line::Bot::Client.new do |config|
  config.channel_id     = "LINE_CHANNEL_ID"
  config.channel_secret = "LINE_CHANNEL_SECRET"
  config.channel_mid    = "LINE_CHANNEL_MID"
end

client.get_profiles(mids: "uxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ai-saac/line-bot.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
