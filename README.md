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
  config.proxy          = "http://proxy.example.com/" # Optional
end

client.get_profiles(["array_of_mids_of_user"])
# => {
# :status=>200,
# :body=>{"contacts"=>[{"displayName"=>"Aisaac", ...

client.send_text(["array_of_mids_of_target_recipient"], text: "Hello world")
#=> {
# :status=>200,
# :body=>{"failed"=>[], "messageId"=>"1460267791059", "timestamp"=>1460267791059...

client.get_message_content("1460267791059")
# => {
# :status=>200,
# :body=> {"result":[{"content":{...
```

#### all examples
```ruby
client.send_text(["uxxxxxxxxxxxxx"],
  text: "Hi!"
)

client.send_image(["uxxxxxxxxxxxxx"],
  originalContentUrl: "http://example.com/original.jpg",
  previewImageUrl: "http://example.com/preview.jpg"
)

client.send_video(["uxxxxxxxxxxxxx"],
  originalContentUrl: "http://example.com/original.jpg",
  previewImageUrl: "http://example.com/preview.jpg"
)

client.send_audio(["uxxxxxxxxxxxxx"],
  originalContentUrl: "http://example.com/original.m4a",
  contentMetadata: {
    "AUDLEN" => "240000"
  }
)

client.send_location(["uxxxxxxxxxxxxx"],
  text: "Hi!",
  location: {
    title: "Convention center",
    latitude: 35.61823286112982,
    longitude: 139.72824096679688
  }
)

client.send_sticker(["uxxxxxxxxxxxxx"],
  contentMetadata: {
    "STKID" => "3",
    "STKPKGID" => "332",
    "STKVER" => "100" # Optional
  }
)

client.get_profiles(["uxxxxxxxxxxxxx"])

client.get_message_content("1460267791059")

client.get_message_content_preview("1460267791059")
```

## Development

#### Setup

```
$ bundle install --path vendor/bundle

# Option 1
$ cp .envrc.sample .envrc

( update .envrc as your configs )

$ direnv allow .

# Option 2
$ export LINE_CHANNEL_ID=xxxxxxx
$ export LINE_CHANNEL_SECRET=xxxxxxx
$ export LINE_CHANNEL_MID=xxxxxxx
```

#### run test

```
$ bundle exec test
```

#### Try it in console

```
$ bin/console
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ai-saac/line-bot.

I'm open to any suggestions :) Please feel free to open issues!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
