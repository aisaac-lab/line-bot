require 'test_helper'

class Line::Bot::HeadersTest < Minitest::Test
  def test_request_headers
    assert_equal(
      {
        'User-Agent'                   => "LineBotGem/#{Line::Bot::VERSION}",
        'Content-Type'                 => 'application/json; charset=UTF-8',
        'X-Line-ChannelID'             => $client.channel_id,
        'X-Line-ChannelSecret'         => $client.channel_secret,
        'X-Line-Trusted-User-With-ACL' => $client.channel_mid
      },
      Line::Bot::Headers.new($client, :get, "https://aisaac.in").request_headers
    )
  end
end
