require 'test_helper'

class Line::Bot::ClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Line::Bot::VERSION
  end

  def test_credentials
    assert_equal(
      {
        channel_id:     ENV["LINE_CHANNEL_ID"],
        channel_secret: ENV["LINE_CHANNEL_SECRET"],
        channel_mid:    ENV["LINE_CHANNEL_MID"]
      },
      $client.credentials
    )
  end

  def test_credentials?
    assert $client.credentials?
  end
end
