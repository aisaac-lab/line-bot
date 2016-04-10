require 'test_helper'

class Line::Bot::ApiTest < Minitest::Test
  def setup
    @mids = [ENV["LINE_CHANNEL_MID"]]
  end

  def test_get_profiles
    response = $client.get_profiles(@mids)

    assert_equal 200, response[:status]
    refute_nil response[:body]["contacts"]
  end

  # def test_send_text
  #   response = $client.send_text(@mids, "Hello world")
  #
  #   assert_equal 200, response[:status]
  # end
end
