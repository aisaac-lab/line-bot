require 'test_helper'

class Line::Bot::API::ProfileTest < Minitest::Test
  def setup
    @sample_mids = [ENV["LINE_SAMPLE_CHANNEL_MID"]]
    @sample_multi_mids = [ENV["LINE_SAMPLE_CHANNEL_MID"], ENV["LINE_CHANNEL_MID"]]
  end

  def test_get_profiles
    response = $client.get_profiles @sample_mids
    assert_equal 200, response[:status]
    refute_nil response[:body]["contacts"]
  end

  def test_get_multi_profiles
    response = $client.get_profiles @sample_multi_mids
    assert_equal 200, response[:status]
    assert_equal 2, response[:body]["contacts"].count
  end
end
