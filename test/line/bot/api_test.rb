require 'test_helper'

class Line::Bot::ApiTest < Minitest::Test
  def test_get_profiles
    assert_equal "Aisaac", $client.get_profiles([ENV["LINE_CHANNEL_MID"]])
  end
end
